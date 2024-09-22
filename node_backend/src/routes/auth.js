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
router.post("/login", async function(res, req){
    try{

        const {Username,Password} = req.body;

        //Find the user by username
        const user = await User.findOne({Username});
        
        //Checking User
        if(!user){
            return res.statusCode(404).json({message : "User not Found"});
        } 
        if(user.Password !== Password) {
            return res.statusCode(404).json({message:"Password did not Match"})
        }

        //After Successful Checking 
        const response = {message:'User is logged in.'}
    
        return res.statusCode(200).json(response);    

    }catch{
        res.statusCode(404).json({message:"Error Logging in",error})
    }
})
);

module.exports = router;
