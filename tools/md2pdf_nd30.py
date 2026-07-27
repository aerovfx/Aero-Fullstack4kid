#!/usr/bin/env python3
"""
MD2PDF_ND30 - Chuyển đổi Markdown sang PDF chuẩn Nghị định 30/2020/NĐ-CP
=======================================================================
Quy chuẩn văn bản hành chính nhà nước (Nghị định 30/2020/NĐ-CP):
- Khổ giấy: A4 (210 x 297 mm)
- Phông chữ: Times New Roman (Unicode TCVN 6909:2001)
- Lề trang: Trên 2.0 cm, Dưới 2.0 cm, Trái 3.0 cm, Phải 2.0 cm
- Nội dung: Cỡ chữ 13-14 pt, căn đều 2 bên (Justified), lùi đầu dòng 1.0 cm, giãn dòng 1.3 - 1.5.
- Tiêu đề mục (Headings): Cỡ chữ 13-15 pt, in hoa/in đậm đúng quy chuẩn.
- Bảng biểu: Căn giữa, viền 0.5pt, tiêu đề dòng đậm/nền xám nhẹ.
- Đánh số trang: Đáy trang ở giữa (Page X / Y).
"""

import os
import sys
import argparse
import re
from pathlib import Path

import markdown
from bs4 import BeautifulSoup
from xhtml2pdf import pisa

DEFAULT_FONT_NAME = "Times New Roman"
DEFAULT_BODY_SIZE = 13       # 13 pt
DEFAULT_LINE_SPACING = 1.3   # 1.3x
DEFAULT_MARGIN_TOP = 2.0     # 2.0 cm
DEFAULT_MARGIN_BOTTOM = 2.0  # 2.0 cm
DEFAULT_MARGIN_LEFT = 3.0    # 3.0 cm (Lề rộng đóng sổ)
DEFAULT_MARGIN_RIGHT = 2.0   # 2.0 cm
DEFAULT_FIRST_LINE_INDENT = 1.0 # 1.0 cm

def find_system_times_fonts():
    """Tìm đường dẫn phông chữ Times New Roman TTF trên macOS và Linux."""
    candidate_paths = [
        # macOS paths
        "/System/Library/Fonts/Supplemental/Times New Roman.ttf",
        "/System/Library/Fonts/Supplemental/Times New Roman Bold.ttf",
        "/System/Library/Fonts/Supplemental/Times New Roman Italic.ttf",
        "/System/Library/Fonts/Supplemental/Times New Roman Bold Italic.ttf",
        # Linux paths
        "/usr/share/fonts/truetype/msttcorefonts/Times_New_Roman.ttf",
        "/usr/share/fonts/truetype/msttcorefonts/Times_New_Roman_Bold.ttf",
        "/usr/share/fonts/truetype/msttcorefonts/Times_New_Roman_Italic.ttf",
        "/usr/share/fonts/truetype/msttcorefonts/Times_New_Roman_Bold_Italic.ttf",
    ]
    
    font_map = {
        "regular": None,
        "bold": None,
        "italic": None,
        "bold_italic": None
    }
    
    for path in candidate_paths:
        if os.path.exists(path):
            p_lower = path.lower()
            if "bold italic" in p_lower or "bold_italic" in p_lower:
                font_map["bold_italic"] = path
            elif "bold" in p_lower:
                font_map["bold"] = path
            elif "italic" in p_lower:
                font_map["italic"] = path
            else:
                if not font_map["regular"]:
                    font_map["regular"] = path
                    
    return font_map

def generate_nd30_css(font_size=DEFAULT_BODY_SIZE, line_spacing=DEFAULT_LINE_SPACING, 
                      margin_top=DEFAULT_MARGIN_TOP, margin_bottom=DEFAULT_MARGIN_BOTTOM, 
                      margin_left=DEFAULT_MARGIN_LEFT, margin_right=DEFAULT_MARGIN_RIGHT):
    """Tạo CSS tùy chỉnh tuân thủ tuyệt đối Nghị định 30/2020/NĐ-CP."""
    font_map = find_system_times_fonts()
    
    font_faces = ""
    if font_map["regular"]:
        font_faces += f"""
        @font-face {{
            font-family: 'Times New Roman';
            src: url('{font_map["regular"]}');
        }}"""
    if font_map["bold"]:
        font_faces += f"""
        @font-face {{
            font-family: 'Times New Roman';
            font-weight: bold;
            src: url('{font_map["bold"]}');
        }}"""
    if font_map["italic"]:
        font_faces += f"""
        @font-face {{
            font-family: 'Times New Roman';
            font-style: italic;
            src: url('{font_map["italic"]}');
        }}"""
    if font_map["bold_italic"]:
        font_faces += f"""
        @font-face {{
            font-family: 'Times New Roman';
            font-weight: bold;
            font-style: italic;
            src: url('{font_map["bold_italic"]}');
        }}"""

    css = f"""
    {font_faces}

    @page {{
        size: a4 portrait;
        margin-top: {margin_top}cm;
        margin-bottom: {margin_bottom}cm;
        margin-left: {margin_left}cm;
        margin-right: {margin_right}cm;

        @frame footer_frame {{
            -pdf-frame-content: footer_content;
            bottom: 0.8cm;
            height: 1.0cm;
            text-align: center;
        }}
    }}

    body {{
        font-family: 'Times New Roman', serif;
        font-size: {font_size}pt;
        line-height: {line_spacing};
        color: #000000;
        text-align: justify;
    }}

    h1 {{
        font-size: 15pt;
        font-weight: bold;
        text-align: center;
        text-transform: uppercase;
        color: #003366;
        margin-top: 14pt;
        margin-bottom: 8pt;
    }}

    h2 {{
        font-size: 14pt;
        font-weight: bold;
        text-align: left;
        color: #003366;
        margin-top: 12pt;
        margin-bottom: 6pt;
    }}

    h3 {{
        font-size: 13pt;
        font-weight: bold;
        font-style: italic;
        text-align: left;
        color: #222222;
        margin-top: 8pt;
        margin-bottom: 4pt;
    }}

    h4, h5, h6 {{
        font-size: 13pt;
        font-style: italic;
        text-align: left;
        margin-top: 6pt;
        margin-bottom: 2pt;
    }}

    p {{
        text-indent: 1.0cm;
        margin-top: 0pt;
        margin-bottom: 4pt;
    }}

    ul, ol {{
        margin-top: 2pt;
        margin-bottom: 6pt;
        padding-left: 1.0cm;
    }}

    li {{
        text-align: justify;
        margin-bottom: 2pt;
    }}

    blockquote {{
        margin-left: 1.2cm;
        margin-right: 0.5cm;
        margin-top: 6pt;
        margin-bottom: 6pt;
        padding-left: 8pt;
        border-left: 3px solid #003366;
        background-color: #F4F6F9;
        font-style: italic;
        color: #444444;
    }}

    pre {{
        font-family: 'Courier', 'Consolas', monospace;
        font-size: 9.5pt;
        background-color: #F8F9FA;
        border: 1px solid #E0E0E0;
        padding: 6pt;
        margin-top: 6pt;
        margin-bottom: 6pt;
        white-space: pre-wrap;
        word-wrap: break-word;
    }}

    code {{
        font-family: 'Courier', 'Consolas', monospace;
        font-size: 10pt;
        color: #B42828;
        background-color: #F4F4F4;
        padding: 1pt 3pt;
    }}

    table {{
        width: 100%;
        border-collapse: collapse;
        margin-top: 8pt;
        margin-bottom: 8pt;
    }}

    th, td {{
        border: 1px solid #808080;
        padding: 5pt 7pt;
        font-size: 11.5pt;
        line-height: 1.2;
    }}

    th {{
        background-color: #F2F4F7;
        font-weight: bold;
        text-align: center;
    }}

    hr {{
        border: none;
        border-top: 1px solid #CCCCCC;
        margin-top: 10pt;
        margin-bottom: 10pt;
    }}

    a {{
        color: #0050A0;
        text-decoration: underline;
    }}

    #footer_content {{
        font-family: 'Times New Roman', serif;
        font-size: 11pt;
        color: #666666;
        text-align: center;
    }}
    """
    return css

def convert_md_to_pdf(input_path: str, output_path: str = None, font_size=DEFAULT_BODY_SIZE, 
                      line_spacing=DEFAULT_LINE_SPACING, margin_top=DEFAULT_MARGIN_TOP, 
                      margin_bottom=DEFAULT_MARGIN_BOTTOM, margin_left=DEFAULT_MARGIN_LEFT, 
                      margin_right=DEFAULT_MARGIN_RIGHT):
    """Chuyển đổi file Markdown hoặc toàn bộ thư mục sang PDF chuẩn Nghị định 30/2020/NĐ-CP."""
    input_p = Path(input_path)
    if not input_p.exists():
        print(f"[-] Lỗi: Không tìm thấy tệp đầu vào {input_path}")
        sys.exit(1)

    css_styles = generate_nd30_css(
        font_size=font_size,
        line_spacing=line_spacing,
        margin_top=margin_top,
        margin_bottom=margin_bottom,
        margin_left=margin_left,
        margin_right=margin_right
    )

    def convert_single(md_file_path: Path, out_pdf_path: Path):
        with open(md_file_path, 'r', encoding='utf-8') as f:
            md_text = f.read()
            
        html_body = markdown.markdown(
            md_text,
            extensions=['tables', 'fenced_code', 'nl2br', 'sane_lists']
        )
        
        full_html = f"""<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <style>{css_styles}</style>
</head>
<body>
    <div id="footer_content">
        Trang <pdf:pagenumber/> / <pdf:pagecount/>
    </div>
    {html_body}
</body>
</html>"""

        out_pdf_path.parent.mkdir(parents=True, exist_ok=True)
        with open(out_pdf_path, 'wb') as f_pdf:
            pisa_status = pisa.CreatePDF(full_html, dest=f_pdf, encoding='utf-8')
            
        if pisa_status.err:
            print(f"[-] Lỗi khi tạo PDF cho {md_file_path}")
        else:
            print(f"[✅ THÀNH CÔNG] Đã xuất file PDF: {out_pdf_path}")

    if input_p.is_file():
        if not output_path:
            output_path = str(input_p.with_suffix('.pdf'))
        convert_single(input_p, Path(output_path))
    elif input_p.is_dir():
        out_dir = Path(output_path) if output_path else input_p
        md_files = list(input_p.glob('**/*.md'))
        print(f"[+] Tìm thấy {len(md_files)} tệp Markdown trong thư mục {input_path}")
        for md_file in md_files:
            rel_p = md_file.relative_to(input_p)
            out_file = out_dir / rel_p.with_suffix('.pdf')
            convert_single(md_file, out_file)

def main():
    parser = argparse.ArgumentParser(description="Convert Markdown files to PDF complying with VN State Decree 30/2020/NĐ-CP.")
    parser.add_argument("input", help="Path to input .md file or directory containing .md files")
    parser.add_argument("-o", "--output", help="Path to output .pdf file or output directory")
    parser.add_argument("--font-size", type=int, default=DEFAULT_BODY_SIZE, help="Body text font size (default: 13pt)")
    parser.add_argument("--line-spacing", type=float, default=DEFAULT_LINE_SPACING, help="Line spacing factor (default: 1.3)")
    parser.add_argument("--margin-top", type=float, default=DEFAULT_MARGIN_TOP, help="Top margin in cm (default: 2.0)")
    parser.add_argument("--margin-bottom", type=float, default=DEFAULT_MARGIN_BOTTOM, help="Bottom margin in cm (default: 2.0)")
    parser.add_argument("--margin-left", type=float, default=DEFAULT_MARGIN_LEFT, help="Left margin in cm (default: 3.0)")
    parser.add_argument("--margin-right", type=float, default=DEFAULT_MARGIN_RIGHT, help="Right margin in cm (default: 2.0)")
    
    args = parser.parse_args()
    convert_md_to_pdf(
        args.input,
        args.output,
        font_size=args.font_size,
        line_spacing=args.line_spacing,
        margin_top=args.margin_top,
        margin_bottom=args.margin_bottom,
        margin_left=args.margin_left,
        margin_right=args.margin_right
    )

if __name__ == "__main__":
    main()
