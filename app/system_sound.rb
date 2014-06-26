# source from Todd Werth: https://gist.githubusercontent.com/twerth/5523040/raw/7f6d221957cbe2e3439df70e016287c0ebd97635/system_sounds.rb 
#
# Add the following to your Rakefile
# app.frameworks += ['MediaPlayer']

# usage: SystemSounds.play_system_sound "tin.mp3"

class SystemSounds
  class << self

    BASE_AUDIO_PATH = "#{NSBundle.mainBundle.resourcePath}/audio/"
    @@system_sounds = {}

    def play_system_sound(file_name)
      path = "#{BASE_AUDIO_PATH}#{file_name}"
      sound_id = find_or_create_sound_id(path)
      AudioServicesPlaySystemSound(sound_id[0])
    end

    def find_or_create_sound_id(file_name)
      unless sound_id = @@system_sounds[file_name]
        sound_id = Pointer.new('I')
        @@system_sounds[file_name] = sound_id
        AudioServicesCreateSystemSoundID(NSURL.fileURLWithPath(file_name), sound_id)
      end

      sound_id
    end

  end
end