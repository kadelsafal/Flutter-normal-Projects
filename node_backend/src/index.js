
//Initialization
const express = require("express");
const app = express();

const authRoutes = require("./routes/auth");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
app.use(bodyParser.json());

mongoose.connect("mongodb+srv://kadel:kadel@cluster0.imkx4.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0").then(function(){
//App Route
app.get("/", function(req, res){
    res.send("This is the Home page");
})
app.use("/auth",authRoutes);

});



//Starting the server on the port
app.listen(3000, function(){
    console.log("Server running");
});
