const Discord = require("discord.js")

//bot dijalankan
const client = new Discord.Client()
client.once("ready", () => {
	console.log(client.channels)
})

client.login(token)