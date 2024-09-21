const express = require("express");
const router = express.Router();
const User = require('./../models/user_model');  // Make sure 'User' matches what was exported

// Signup route
router.post("/signup", async function (req, res) {
    try {
        // Create a new user instance
        const newUser = new User({
            Name: req.body.Name,
            Username: req.body.Username,
            Password: req.body.Password
        });

        // Save the new user to the database
        await newUser.save();

        // Respond with a success message
        const response = { message: `New user signed up. Name: ${newUser.Name}` };
        res.status(201).json(response);
    } catch (error) {
        // Handle errors (like validation errors or DB errors)
        res.status(500).json({ message: "Error signing up user", error });
    }
});

module.exports = router;
