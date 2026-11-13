import sys, secrets, string

# Either "pw" or "pw 24" or "pw $_+-#" or "pw 24 $_+-#"
length = int(sys.argv[1]) if len(sys.argv) >= 2 and sys.argv[1].isdigit() else 12
try:  # errors on no args or 1 digit arg
    chars = (
        sys.argv[1] if len(sys.argv) == 2 and not sys.argv[1].isdigit() else sys.argv[2]
    )
except IndexError:
    chars = "!+-@_$"

# see https://docs.python.org/3/library/secrets.html
alphabet = string.ascii_letters + string.digits + chars
while True:
    password = "".join(secrets.choice(alphabet) for i in range(length))
    if (
        any(c.islower() for c in password)
        and any(c.isupper() for c in password)
        # and sum(c.isdigit() for c in password) >= 3
        and any(c.isdigit() for c in password)
        and password.isalnum() is False
    ):
        break

print(password)