import json

def generate_threat_intel_prompt(news_text: str) -> str:
    """Generates a structured Zero-Hallucination prompt for Threat Intel processing."""
    system_instruction = (
        "You are a Senior Threat Intelligence Analyst. "
        "Extract IOCs (IPs, File Hashes, Domains) from the input text. "
        "Return ONLY a valid JSON object matching this schema:\n"
        "{\n"
        '  "ips": [],\n'
        '  "hashes": [],\n'
        '  "domains": [],\n'
        '  "threat_level": "LOW/MEDIUM/HIGH/CRITICAL"\n'
        "}"
    )
    
    prompt = f"[SYSTEM INSTRUCTION]\n{system_instruction}\n\n[INPUT TEXT]\n{news_text}"
    return prompt

if __name__ == "__main__":
    sample_text = "Security alert: Rogue host 10.0.0.55 communicated with bad domain malicious-c2.test."
    print("=== THREAT INTEL PROMPT GENERATOR ===")
    formatted_prompt = generate_threat_intel_prompt(sample_text)
    print(formatted_prompt)
