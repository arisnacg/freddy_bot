const Discord = require("discord.js")
const {token, channelID} = require("./config.json")

//bot dijalankan
const client = new Discord.Client()
client.once("ready", () => {
	client.channels.get(channelID).send("Hello there!")
})

client.login(token)