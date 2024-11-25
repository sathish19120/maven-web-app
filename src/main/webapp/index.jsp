<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dynamic Website</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <nav>
            <ul class="navbar">
                <li><a href="#home">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </nav>
    </header>

    <section id="home" class="section">
        <h1>Welcome to My Dynamic Website</h1>
        <p>This is a simple and interactive website built with HTML, CSS, and JavaScript.</p>
        <div id="clock"></div>
        <button onclick="showQuote()">Click for a Motivational Quote</button>
        <p id="quote"></p>
    </section>

    <section id="about" class="section">
        <h2>About</h2>
        <p>This website demonstrates basic web technologies and interactivity using JavaScript.</p>
    </section>

    <section id="contact" class="section">
        <h2>Contact</h2>
        <p>Email: example@example.com</p>
    </section>

    <footer>
        <p>&copy; 2024 Sathish Kumar. All rights reserved.</p>
    </footer>

    <script src="script.js"></script>
</body>
</html>
