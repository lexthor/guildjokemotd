JokeList = JokeList or {}

function AddJoke(joke)
    if type(joke) ~= "table" then
        return
    end
    for _, jokeText in ipairs(joke) do
        table.insert(JokeList, jokeText)
    end
end
