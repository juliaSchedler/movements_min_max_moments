library(tuneR)

audio <- readMP3("music_sync.mp3")  # or readWave() for .wav files
duration_sec <- length(audio@left) / audio@samp.rate
print(duration_sec)

target_duration <- duration_sec  # seconds from audio
fps <- 30
frame_count <- ceiling(target_duration * fps)  

nrow(monthly_weather)/target_duration


## chatgpt help 

sync_framerate_plan <- function(n_data = 1392, duration_sec = 354, frames_per_data = 8) {
  total_frames <- n_data * frames_per_data
  fps <- total_frames / duration_sec
  frame_duration <- duration_sec / total_frames
  data_point_duration <- duration_sec / n_data
  
  list(
    frames_per_data_point = frames_per_data,
    total_frames = total_frames,
    target_fps = fps,
    seconds_per_frame = frame_duration,
    seconds_per_data_point = data_point_duration
  )
}

plan <- sync_framerate_plan(n_data = 1392, duration_sec = 354, frames_per_data = 8)
str(plan)




n_data <- 1392
duration <- 354
fps <- 30

total_frames <- duration * fps             # 354 * 30 = 10,620
frames_per_data <- floor(total_frames / n_data)   # 10620 / 1392 ≈ 7.63 → round to 8
adjusted_total_frames <- n_data * frames_per_data # 1392 * 8 = 11,136
adjusted_duration <- adjusted_total_frames / fps 





### TROUBLE SHOOTING 

### bash

ffmpeg -r 31.45 -start_number 1 -i frames_inc/frame%04d.png \
-i music_test.mp3 \
-c:v libx264 -pix_fmt yuv420p \
-c:a aac \
-shortest \
-movflags +faststart \
animation_test.mp4


ffmpeg \
-framerate 31.45 -start_number 1 -i frames_inc/frame%04d.png \
-i music_test.mp3 \
-c:v libx264 -pix_fmt yuv420p \
-video_track_timescale 1000 \
-c:a aac \
-shortest \
-movflags +faststart \
animation_test_fixed.mp4



ffmpeg -r 31.45 -start_number 1 -i frames_inc/frame%04d.png \
-i music_test.mp3 \
-c:v libx264 -pix_fmt yuv420p \
-movflags +faststart \
video_only.mp4

#354.063563
ffprobe -i music_sync.mp3 -show_entries format=duration -v quiet -of csv="p=0"



60 bpm ->
  speed_ratio = 354 / 354.085851  #0.9997575

ffmpeg -i music_test.mp3 -filter:a "atempo=0.99444" music_adjusted.mp3


ffmpeg -i video_only.mp4 -i music_adjusted.mp3 \
-c:v copy -c:a aac -shortest animation_synced.mp4











