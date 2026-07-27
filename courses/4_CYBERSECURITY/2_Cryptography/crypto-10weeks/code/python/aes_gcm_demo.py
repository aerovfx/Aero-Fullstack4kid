from Crypto.Cipher import AES
from Crypto.Random import get_random_bytes

def encrypt_file_aes_gcm(input_path: str, output_path: str, key: bytes):
    """Encrypts a file securely using AES-256-GCM."""
    nonce = get_random_bytes(12)
    cipher = AES.new(key, AES.MODE_GCM, nonce=nonce)
    
    with open(input_path, "rb") as f_in:
        data = f_in.read()
        
    ciphertext, tag = cipher.encrypt_and_digest(data)
    
    with open(output_path, "wb") as f_out:
        f_out.write(nonce + tag + ciphertext)
    print(f"[+] Encrypted file saved to: {output_path}")

def decrypt_file_aes_gcm(input_path: str, output_path: str, key: bytes):
    """Decrypts an AES-256-GCM encrypted file and verifies integrity."""
    with open(input_path, "rb") as f_in:
        data = f_in.read()
        
    nonce = data[:12]
    tag = data[12:28]
    ciphertext = data[28:]
    
    cipher = AES.new(key, AES.MODE_GCM, nonce=nonce)
    plaintext = cipher.decrypt_and_verify(ciphertext, tag)
    
    with open(output_path, "wb") as f_out:
        f_out.write(plaintext)
    print(f"[+] Decrypted file saved to: {output_path}")

if __name__ == "__main__":
    key = get_random_bytes(32)
    print("=== AES-256-GCM SECURE FILE ENCRYPTOR DEMO ===")
