import bcrypt

def hash_password(password: str) -> bytes:
    """Hashes a password using bcrypt with a automatically generated salt."""
    salt = bcrypt.gensalt(rounds=12) # Cost factor 12 (intentionally slow)
    hashed = bcrypt.hashpw(password.encode('utf-8'), salt)
    return hashed

def verify_password(password: str, hashed: bytes) -> bool:
    """Verifies a password against the stored bcrypt hash."""
    return bcrypt.checkpw(password.encode('utf-8'), hashed)

if __name__ == "__main__":
    print("=== BCRYPT SECURE PASSWORD HASHING DEMO ===")
    
    user_pw = "SuperSecretPassword123!"
    print(f"[+] Original Password: {user_pw}")
    
    hashed_pw = hash_password(user_pw)
    print(f"[+] Generated Bcrypt Hash: {hashed_pw.decode('utf-8')}")
    
    # Test verification
    test_1 = verify_password("SuperSecretPassword123!", hashed_pw)
    test_2 = verify_password("WrongPassword!", hashed_pw)
    
    print(f"[+] Verification with correct password: {test_1}")
    print(f"[+] Verification with wrong password:   {test_2}")
