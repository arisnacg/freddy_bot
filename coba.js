const Discord = require("discord.js")
const {prefix, token} = require("./config.json")

//bot dijalankan
const client = new Discord.Client()
client.once("ready", () => {
	console.log(client.channels)
})

client.login(token)