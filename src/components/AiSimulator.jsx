import React, { useState, useRef, useEffect } from 'react';
import { Send, Bot, User, Trash2, Cpu, HelpCircle, Terminal } from 'lucide-react';

export default function AiSimulator() {
  const [messages, setMessages] = useState([
    {
      sender: 'bot',
      text: 'Xin chào! Tôi là Trợ lý AI Đa năng của Học viện. Tôi được tích hợp để giải đáp thắc mắc về mọi lộ trình học: Front-End (React/HTML/CSS), Back-End (Node.js/APIs), Software Tools (Git/Docker), Data Science (NumPy/Pandas), Web3 (Solidity/DApps) và Cyber Security. Hãy gửi cho tôi câu hỏi hoặc đoạn code cần phân tích!'
    }
  ]);
  const [input, setInput] = useState('');
  const [loading, setLoading] = useState(false);
  const messagesEndRef = useRef(null);

  const samplePrompts = [
    {
      title: "Hỏi về React State",
      desc: "Giải thích useState Hook trong React",
      prompt: "Làm thế nào để sử dụng useState Hook trong React để quản lý trạng thái của một form nhập liệu?"
    },
    {
      title: "Lỗi Docker Compose",
      desc: "Cách liên kết Web và Database",
      prompt: "Tôi muốn viết file docker-compose.yml liên kết một Node.js web app với cơ sở dữ liệu MongoDB. Hãy hướng dẫn cách viết và cấu hình mạng?"
    },
    {
      title: "Pandas GroupBy",
      desc: "Tổng hợp doanh số với Pandas",
      prompt: "Tôi có bảng dữ liệu bán hàng trong Pandas DataFrame. Làm cách nào để tính tổng doanh thu theo từng danh mục sản phẩm bằng lệnh GroupBy?"
    },
    {
      title: "Solidity Transfer",
      desc: "Kiểm tra ví và chuyển tiền an toàn",
      prompt: "Hãy hướng dẫn viết hàm rút tiền withdraw trong Solidity có cơ chế kiểm tra điều kiện ví người gửi an toàn tránh lỗi reentrancy?"
    }
  ];

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  };

  useEffect(() => {
    scrollToBottom();
  }, [messages]);

  const handleSend = (textToSend = input) => {
    if (!textToSend.trim()) return;

    const userMsg = { sender: 'user', text: textToSend };
    setMessages(prev => [...prev, userMsg]);
    setInput('');
    setLoading(true);

    setTimeout(() => {
      let botResponse = '';
      const promptLower = textToSend.toLowerCase();

      if (promptLower.includes('react') || promptLower.includes('state') || promptLower.includes('usestate')) {
        botResponse = `### [!] HƯỚNG DẪN SỬ DỤNG USESTATE TRONG REACT:
        
1. **Khái niệm cơ bản**:
   - \`useState\` là một Hook cho phép bạn thêm trạng thái React vào các functional components.
   - Nó trả về một mảng chứa 2 phần tử: giá trị trạng thái hiện tại và một hàm dùng để cập nhật giá trị đó.

2. **Ví dụ quản lý trạng thái của Form**:
   \`\`\`javascript
   import React, { useState } from 'react';
   
   function LoginForm() {
       const [email, setEmail] = useState('');
       const [password, setPassword] = useState('');
       
       const handleSubmit = (e) => {
           e.preventDefault();
           console.log("Đăng nhập với:", email, password);
       };
       
       return (
           <form onSubmit={handleSubmit}>
               <input 
                   type="email" 
                   value={email} 
                   onChange={(e) => setEmail(e.target.value)} 
                   placeholder="Nhập email..." 
               />
               <input 
                   type="password" 
                   value={password} 
                   onChange={(e) => setPassword(e.target.value)} 
                   placeholder="Mật khẩu..." 
               />
               <button type="submit">Đăng Nhập</button>
           </form>
       );
   }
   \`\`\`

3. **Mẹo tối ưu**:
   - Để quản lý form có nhiều trường dữ liệu, bạn có thể sử dụng một đối tượng duy nhất trong state \`const [formData, setFormData] = useState({ name: '', email: '' })\` để code gọn gàng hơn.
        `;
      } else if (promptLower.includes('docker') || promptLower.includes('compose') || promptLower.includes('yml')) {
        botResponse = `### [!] HƯỚNG DẪN VIẾT DOCKER COMPOSE CHO WEB & DATABASE:
        
1. **Kiến trúc liên kết**:
   - Web container cần kết nối tới DB container thông qua tên dịch vụ làm hostname (ví dụ: \`mongodb://db:27017\`).
   - Cần cấu hình \`depends_on\` để đảm bảo database được khởi chạy trước web app.

2. **File docker-compose.yml mẫu**:
   \`\`\`yaml
   version: '3.8'
   
   services:
     web:
       build: .
       ports:
         - "3000:3000"
       environment:
         - MONGO_URI=mongodb://db:27017/shopdb
       depends_on:
         - db
       networks:
         - app-network
   
     db:
       image: mongo:6.0
       ports:
         - "27017:27017"
       volumes:
         - mongo_data:/data/db
       networks:
         - app-network
   
   volumes:
     mongo_data:
   
   networks:
     app-network:
       driver: bridge
   \`\`\`

3. **Lệnh thực thi**:
   - Chạy cụm container ở chế độ background: \`docker-compose up -d\`
   - Dừng và xóa tài nguyên: \`docker-compose down\`
        `;
      } else if (promptLower.includes('pandas') || promptLower.includes('groupby') || promptLower.includes('doanh thu')) {
        botResponse = `### [!] PHÂN TÍCH DOANH THU BẰNG PANDAS GROUPBY:
        
1. **Cơ chế hoạt động**:
   - Hàm \`groupby()\` của Pandas hoạt động theo mô hình **Split-Apply-Combine** (Chia tách - Áp dụng - Kết hợp).
   - Chia tách dữ liệu theo nhóm, áp dụng hàm cộng tổng (\`sum()\`), và kết hợp lại thành DataFrame mới.

2. **Đoạn code Python thực hành**:
   \`\`\`python
   import pandas as pd
   
   # Giả lập bảng dữ liệu bán hàng
   data = {
       'category': ['Web', 'Mobile', 'AI', 'Web', 'Mobile', 'AI'],
       'revenue': [1500, 800, 3000, 1200, 950, 4500]
   }
   df = pd.DataFrame(data)
   
   # Tính tổng doanh thu theo từng category
   summary = df.groupby('category')['revenue'].sum().reset_index()
   
   # Sắp xếp kết quả doanh thu giảm dần
   summary = summary.sort_values(by='revenue', ascending=False)
   print(summary)
   \`\`\`

3. **Kết quả đầu ra**:
   \`\`\`text
     category  revenue
   0       AI     7500
   2      Web     2700
   1   Mobile     1750
   \`\`\`
        `;
      } else if (promptLower.includes('solidity') || promptLower.includes('withdraw') || promptLower.includes('wallet') || promptLower.includes('contract')) {
        botResponse = `### [!] VIẾT HÀM RÚT TIỀN (WITHDRAW) AN TOÀN TRONG SOLIDITY:
        
1. **Rủi ro tấn công Reentrancy**:
   - Lỗi reentrancy xảy ra khi một contract chuyển ETH đi trước khi cập nhật số dư. Kẻ tấn công có thể viết một contract độc hại gọi lại hàm withdraw liên tiếp trước khi trạng thái kịp cập nhật để rút hết tiền của hợp đồng.

2. **Cách khắc phục chuẩn (Checks-Effects-Interactions Pattern)**:
   - **Bước 1 (Checks)**: Kiểm tra điều kiện số dư.
   - **Bước 2 (Effects)**: Cập nhật trạng thái số dư về 0 trước khi gửi.
   - **Bước 3 (Interactions)**: Thực hiện chuyển tiền đi.

3. **Code Solidity mẫu an toàn**:
   \`\`\`solidity
   pragma solidity ^0.8.0;
   
   contract SecureBank {
       mapping(address => uint256) public balances;
       
       // Sử dụng ReentrancyGuard của OpenZeppelin làm modifier
       bool private locked;
       modifier noReentrant() {
           require(!locked, "No reentrancy allowed");
           locked = true;
           _;
           locked = false;
       }
       
       function withdraw(uint256 amount) public noReentrant {
           // 1. Checks
           require(balances[msg.sender] >= amount, "Khong du so du");
           
           // 2. Effects
           balances[msg.sender] -= amount;
           
           // 3. Interactions
           (bool success, ) = msg.sender.call{value: amount}("");
           require(success, "Chuyen tien that bai");
       }
   }
   \`\`\`
        `;
      } else if (promptLower.includes('nmap') || promptLower.includes('port') || promptLower.includes('log') || promptLower.includes('security')) {
        botResponse = `### [!] HỖ TRỢ KỸ THUẬT AN NINH MẠNG & BẢO MẬT:
        
Tôi có các giải pháp sau cho câu hỏi bảo mật của bạn:
- **Quét Nmap**: Sử dụng \`nmap -sV --script vuln 127.0.0.1\` để kiểm toán các cổng mở trên máy của bạn.
- **Log máy chủ**: Gửi log thô của Nginx/Syslog, tôi sẽ phát hiện các mẫu tấn công SQL Injection/XSS.
- **Quét code lỗi**: Gửi hàm C++ hoặc Python, tôi sẽ kiểm tra lỗi bảo mật bộ nhớ (Buffer Overflow, Pointer leaks).
        `;
      } else {
        botResponse = `### [!] ĐÃ NHẬN YÊU CẦU CỦA BẠN:
        
Tôi sẵn sàng hỗ trợ bạn phân tích hoặc viết mã nguồn cho các kỹ năng:
- **Front-End**: Xây dựng layout responsive CSS, React hooks, APIs.
- **Back-End**: Lập trình Express routes, cơ sở dữ liệu MongoDB/SQL, JWT Auth.
- **Software Tools**: Quản trị repository Git, viết Dockerfile/Docker Compose.
- **Data Science**: Xử lý mảng NumPy, làm sạch và group DataFrames bằng Pandas.
- **Web3**: Lập trình Solidity Smart Contracts, tiêu chuẩn ERC-20/NFTs.

*Mẹo: Chọn một trong các Prompt mẫu được thiết kế sẵn ở phía trên để chạy thử nghiệm nhanh.*`;
      }

      const botMsg = { sender: 'bot', text: botResponse };
      setMessages(prev => [...prev, botMsg]);
      setLoading(false);
    }, 1500);
  };

  const handleClearChat = () => {
    setMessages([
      {
        sender: 'bot',
        text: 'Lịch sử chat đã được xóa. Tôi sẵn sàng hỗ trợ yêu cầu phân tích mới của bạn!'
      }
    ]);
  };

  return (
    <div style={{
      maxWidth: '1000px',
      margin: '0 auto',
      padding: '24px 0',
      height: 'calc(100vh - 120px)',
      display: 'grid',
      gridTemplateRows: 'auto 1fr auto',
      gap: '16px'
    }}>
      
      {/* Title Header */}
      <div style={{
        display: 'flex',
        justifyContent: 'space-between',
        alignItems: 'center',
        borderBottom: '1px solid rgba(255, 255, 255, 0.05)',
        paddingBottom: '12px'
      }}>
        <div>
          <h2 style={{ fontSize: '1.25rem', fontFamily: 'var(--font-cyber)', display: 'flex', alignItems: 'center', gap: '8px' }}>
            <Cpu size={18} color="var(--color-purple)" className="pulse" />
            <span>AI MULTI-DISCIPLINARY ASSISTANT</span>
          </h2>
          <span style={{ fontSize: '0.75rem', color: 'var(--text-muted)' }}>
            Trợ lý AI đa năng giải đáp Front-End, Back-End, Git/Docker, Data Science, Web3 và Bảo mật
          </span>
        </div>
        <button
          onClick={handleClearChat}
          style={{
            background: 'transparent',
            border: '1px solid rgba(255, 51, 102, 0.2)',
            color: 'var(--color-red)',
            padding: '6px 12px',
            borderRadius: '6px',
            cursor: 'pointer',
            fontSize: '0.75rem',
            fontFamily: 'var(--font-cyber)',
            display: 'flex',
            alignItems: 'center',
            gap: '6px',
            transition: 'var(--transition)'
          }}
          onMouseEnter={(e) => { e.target.style.background = 'rgba(255, 51, 102, 0.05)'; }}
          onMouseLeave={(e) => { e.target.style.background = 'transparent'; }}
        >
          <Trash2 size={12} />
          <span>XÓA HỘI THOẠI</span>
        </button>
      </div>

      {/* Main Chat Area */}
      <div style={{
        display: 'grid',
        gridTemplateColumns: '1fr 280px',
        gap: '20px',
        overflow: 'hidden'
      }}>
        {/* Messages list */}
        <div className="cyber-panel" style={{
          padding: '20px',
          display: 'flex',
          flexDirection: 'column',
          justifyContent: 'space-between',
          background: 'rgba(22, 27, 34, 0.45)',
          overflow: 'hidden'
        }}>
          {/* Scrollable Container */}
          <div style={{
            flexGrow: 1,
            overflowY: 'auto',
            paddingRight: '10px',
            marginBottom: '16px',
            display: 'flex',
            flexDirection: 'column',
            gap: '16px'
          }}>
            {messages.map((msg, i) => {
              const isBot = msg.sender === 'bot';
              return (
                <div 
                  key={i} 
                  style={{
                    display: 'flex',
                    gap: '12px',
                    alignItems: 'flex-start',
                    alignSelf: isBot ? 'flex-start' : 'flex-end',
                    maxWidth: '85%'
                  }}
                >
                  {/* Icon */}
                  {isBot && (
                    <div style={{
                      background: 'rgba(157, 78, 237, 0.1)',
                      border: '1px solid rgba(157, 78, 237, 0.2)',
                      padding: '6px',
                      borderRadius: '6px',
                      display: 'flex',
                      flexShrink: 0
                    }}>
                      <Bot size={16} color="var(--color-purple)" />
                    </div>
                  )}

                  {/* Bubble */}
                  <div style={{
                    background: isBot ? 'rgba(22, 27, 34, 0.8)' : 'rgba(0, 240, 255, 0.05)',
                    border: isBot ? '1px solid rgba(255, 255, 255, 0.05)' : '1px solid rgba(0, 240, 255, 0.2)',
                    borderRadius: '8px',
                    padding: '12px 16px',
                    fontSize: '0.9rem',
                    color: 'var(--text-main)'
                  }}>
                    {isBot ? (
                      <div className="lesson-content" style={{ fontSize: '0.85rem' }}>
                        {msg.text.split('\n').map((line, lIdx) => {
                          if (line.startsWith('### ')) {
                            return <h4 key={lIdx} style={{ color: 'var(--color-purple)', marginTop: '8px', marginBottom: '8px', fontFamily: 'var(--font-cyber)' }}>{line.slice(4)}</h4>;
                          }
                          if (line.startsWith('- ') || line.trim().startsWith('* ')) {
                            return <li key={lIdx} style={{ marginLeft: '12px', marginBottom: '4px', listStyleType: 'circle' }}>{line.trim().slice(2)}</li>;
                          }
                          if (line.startsWith('     ') || line.startsWith('   ') || line.trim().startsWith('```')) {
                            if (line.trim().startsWith('```')) return null;
                            return <pre key={lIdx} style={{ background: '#000', padding: '4px 8px', borderRadius: '4px', fontFamily: 'var(--font-code)', color: 'var(--color-green)', fontSize: '0.8rem', margin: '4px 0', overflowX: 'auto' }}><code>{line.trim()}</code></pre>;
                          }
                          return <p key={lIdx} style={{ margin: '4px 0' }}>{line}</p>;
                        })}
                      </div>
                    ) : (
                      <p style={{ margin: 0, whiteSpace: 'pre-wrap' }}>{msg.text}</p>
                    )}
                  </div>

                  {!isBot && (
                    <div style={{
                      background: 'rgba(0, 240, 255, 0.1)',
                      border: '1px solid rgba(0, 240, 255, 0.2)',
                      padding: '6px',
                      borderRadius: '6px',
                      display: 'flex',
                      flexShrink: 0
                    }}>
                      <User size={16} color="var(--color-cyan)" />
                    </div>
                  )}
                </div>
              );
            })}
            
            {loading && (
              <div style={{ display: 'flex', gap: '12px', alignItems: 'center' }}>
                <div style={{
                  background: 'rgba(157, 78, 237, 0.1)',
                  border: '1px solid rgba(157, 78, 237, 0.2)',
                  padding: '6px',
                  borderRadius: '6px',
                  display: 'flex'
                }}>
                  <Bot size={16} color="var(--color-purple)" className="pulse" />
                </div>
                <span style={{ fontSize: '0.8rem', color: 'var(--text-muted)', fontFamily: 'var(--font-cyber)' }} className="pulse">
                  AI ĐANG XỬ LÝ CÂU HỎI...
                </span>
              </div>
            )}
            
            <div ref={messagesEndRef} />
          </div>

          {/* Form input */}
          <div style={{
            display: 'flex',
            gap: '10px',
            borderTop: '1px solid rgba(255, 255, 255, 0.05)',
            paddingTop: '16px'
          }}>
            <textarea
              value={input}
              onChange={(e) => setInput(e.target.value)}
              onKeyDown={(e) => {
                if (e.key === 'Enter' && !e.shiftKey) {
                  e.preventDefault();
                  handleSend();
                }
              }}
              placeholder="Đặt câu hỏi về HTML, React, Node.js, Docker, Pandas, Solidity, Security..."
              style={{
                flexGrow: 1,
                background: 'rgba(0, 0, 0, 0.4)',
                border: '1px solid rgba(255, 255, 255, 0.08)',
                borderRadius: '8px',
                padding: '12px',
                color: '#fff',
                outline: 'none',
                resize: 'none',
                fontFamily: 'var(--font-body)',
                fontSize: '0.85rem',
                height: '48px',
                lineHeight: '1.4'
              }}
            />
            <button
              onClick={() => handleSend()}
              disabled={loading || !input.trim()}
              className="cyber-btn cyber-btn-purple"
              style={{
                alignSelf: 'center',
                height: '48px',
                padding: '0 20px',
                opacity: loading || !input.trim() ? 0.5 : 1,
                cursor: loading || !input.trim() ? 'not-allowed' : 'pointer'
              }}
            >
              <Send size={16} />
            </button>
          </div>
        </div>

        {/* Prompts library sidebar */}
        <div style={{ display: 'flex', flexDirection: 'column', gap: '16px', overflowY: 'auto' }}>
          <div className="cyber-panel" style={{ padding: '16px' }}>
            <h3 style={{
              fontSize: '0.8rem',
              color: 'var(--color-cyan)',
              fontFamily: 'var(--font-cyber)',
              marginBottom: '12px',
              display: 'flex',
              alignItems: 'center',
              gap: '6px'
            }}>
              <HelpCircle size={14} />
              <span>CÂU HỎI MẪU KHUYÊN DÙNG</span>
            </h3>
            
            <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
              {samplePrompts.map((sp, i) => (
                <button
                  key={i}
                  onClick={() => handleSend(sp.prompt)}
                  style={{
                    background: 'rgba(22, 27, 34, 0.4)',
                    border: '1px solid rgba(255, 255, 255, 0.03)',
                    borderRadius: '6px',
                    padding: '10px',
                    textAlign: 'left',
                    cursor: 'pointer',
                    transition: 'var(--transition)',
                    width: '100%'
                  }}
                  onMouseEnter={(e) => { e.currentTarget.style.borderColor = 'var(--color-cyan)'; }}
                  onMouseLeave={(e) => { e.currentTarget.style.borderColor = 'rgba(255, 255, 255, 0.03)'; }}
                >
                  <h4 style={{ fontSize: '0.8rem', color: '#fff', marginBottom: '4px' }}>{sp.title}</h4>
                  <p style={{ fontSize: '0.7rem', color: 'var(--text-muted)', margin: 0 }}>{sp.desc}</p>
                </button>
              ))}
            </div>
          </div>

          <div className="cyber-panel" style={{ padding: '16px', background: 'rgba(22, 27, 34, 0.2)' }}>
            <h3 style={{
              fontSize: '0.8rem',
              color: 'var(--color-purple)',
              fontFamily: 'var(--font-cyber)',
              marginBottom: '10px'
            }}>
              MẸO ĐẶT CÂU HỎI AI
            </h3>
            <ul style={{ margin: 0, paddingLeft: '16px', fontSize: '0.75rem', color: 'var(--text-muted)' }}>
              <li style={{ marginBottom: '6px' }}>Cung cấp <strong>đoạn code lỗi cụ thể</strong> để AI sửa lỗi nhanh hơn.</li>
              <li style={{ marginBottom: '6px' }}>Quy định rõ <strong>framework và phiên bản</strong> sử dụng.</li>
              <li>Hỏi AI giải thích cơ chế chạy của thư viện khi chưa rõ lý thuyết.</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  );
}
