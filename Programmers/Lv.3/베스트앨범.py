def solution(genres, plays):
    answer = []
    genre_plays = {}
    genre_songs = {}
    
    for song, (genre, play) in enumerate(zip(genres, plays)):
        if genre in genre_plays:
            genre_plays[genre].append((song, play))
        else:
            genre_plays[genre] = [(song, play)]
    
        if genre in genre_songs:
            genre_songs[genre] += play
        else:
            genre_songs[genre] = play
            
    for (genre, play) in sorted(genre_songs.items(), key=lambda x:x[1], reverse=True):
        for (song, play) in sorted(genre_plays[genre], key=lambda x:x[1], reverse=True)[:2]:
            answer.append(song)
    
    return answer
