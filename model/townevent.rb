def townEvent
    events_list = [
        "You see the villagers quietly going about their day as a few adventurers gather around the leaderboard.",
        "From the colourful stalls, it seems like the merchant is in town. Maybe the food at the inn will taste better tonight...",
        "A heavy fog hangs over town and the main street is eerily quiet...",
        "Rain pours endlessly from the sky above and villagers dash for cover.",
        "The sun peeks from behind the clouds, and a ray of light illuminates the face of a female adventurer you never met before..."
    ]
    events_list[rand(0..4)]
end