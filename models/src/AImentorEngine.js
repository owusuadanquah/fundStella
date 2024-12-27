// Server FundStella LLM endpoint
// Server will run at: http://127.0.0.1:3000/ask-mentor
// Sample body payload to endpoint:
//   {"message": "who is joe biden?"} 
// Sample response
//   {"response": "Joe Biden is the 47th president of the US."}
// To terminate model, check the process ID by running "pgrep ollama"
//
// Installation and running: https://itsfoss.com/ollama-setup-linux/
// Step 1) Install ollaman on linux: curl -fsSL https://ollama.com/install.sh | sh
// Step 2) Check that it's running: localhost:11434, returns "Ollama is running"
// Step 3) Download model: ollama pull tinyllama
// Step 4) Run the model: ollama run tinyllama

// Import necessary modules
import express from "express";
import fetch from "node-fetch";

// Initialize the Express app
const app = express();
const PORT = 3000;

// Middleware to parse JSON bodies
app.use(express.json());

// Define the endpoint URL for the LLM
const llmUrl = "http://127.0.0.1:11434/api/generate";

// API endpoint to handle requests
app.post("/ask-mentor", async (req, res) => {
    // Extract the 'message' from the request body
    const message = req.body.message;

    if (!message) {
        return res.status(400).json({ error: "Message is required." });
    }

    const mentorPrompt = `
    You are a mentor for young women in developing countries. 
    Please take into consideration the girl's age and aspirations.
    Respond to the question by answering it directly with your expert knowledge.
    Your answers should involve sustainable and regenerative practices.

    Here is the young woman's question you need to answer: ${message}

    Please respond as if you are speaking directly to the young women.
    `;

    // Define the request payload
    const payload = {
        model: "tinyllama",
        prompt: mentorPrompt,
        stream: false
    };

    // Define the headers for the request
    const headers = {
        "Content-Type": "application/json"
    };

    try {
        // Make the POST request
        const response = await fetch(llmUrl, {
            method: "POST",
            headers: headers,
            body: JSON.stringify(payload)
        });

        let output;

        if (response.ok) {
            const data = await response.json();
            output = { response: data.response };
            console.info("Successful LLM call. Response: ", data.response); // Log the LLM response here
        } else {
            output = {
                response: "I'm sorry, but I ran into an issue trying to answer your question. Please try asking again."
            };
            console.error(`LLM request failed with status ${response.status}: ${response.statusText}`);
        }

        res.json(output);
    } catch (error) {
        console.error("Error while interacting with the LLM:", error);
        res.status(500).send({ error: 'Error interacting with the model' });
    }
});

// Start the Express server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
    console.log("Run 'ollama run tinyllama' to start the LLM API.");
});
