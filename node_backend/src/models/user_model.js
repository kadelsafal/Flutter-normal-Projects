const mongoose = require("mongoose");

const user_schema = mongoose.Schema({
    Name:{
        type: String,
        required:true
    },
    Username:{
        type: String,
        required:true,
        minlength:6
    },
    Password: {
        type: String,
        required:true
    }
});

module.exports = mongoose.model("user_model",user_schema);