#!/bin/bash
sudo apt update
# sudo apt install -y python3

# Create a simple index.html page

cat <<EOF > ~/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Page From Server 1</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #fff;
            font-family: 'Roboto', Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: rgba(0,0,0,0.3);
            padding: 40px 60px;
            border-radius: 20px;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            text-align: center;
        }
        h1 {
            font-size: 3em;
            margin-bottom: 0.2em;
            letter-spacing: 2px;
            animation: glow 2s infinite alternate;
        }
        @keyframes glow {
            from { text-shadow: 0 0 10px #fff, 0 0 20px #667eea; }
            to { text-shadow: 0 0 20px #fff, 0 0 40px #764ba2; }
        }
        p {
            font-size: 1.3em;
            margin-top: 0.5em;
        }
        .footer {
            margin-top: 2em;
            font-size: 0.9em;
            color: #e0e0e0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🚀 Welcome to Server 1! 🚀</h1>
        <p>This is a <b>fancy</b> welcome page served by Python HTTP server on port <b>8000</b>.</p>
        <div class="footer">&copy; 2025 | Powered by <b>Python3</b> & <b>Terraform</b></div>
    </div>
</body>
</html>
EOF

# Run the Python HTTP server in the background with nohup
cd ~
nohup python3 -m http.server 8000 &
