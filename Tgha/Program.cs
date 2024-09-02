// See https://aka.ms/new-console-template for more information
using Telegram.Bot;

Console.WriteLine("Welcome to Telegram Poster");

if (args.Length < 2) throw new ArgumentException("Please supply arguments.");

var token = args[0];
var chatIdString = args[1];


var tryParseResult = long.TryParse(chatIdString, out var chatId);

if (!tryParseResult)
{
    throw new ArgumentException("Please supply chatId.");
}

if (chatId > 0)
{
    throw new ArgumentException("Please supply chatId.");
}

var bot = new TelegramBotClient(token);

await bot.SendTextMessageAsync(chatId, "Halo!");