if File.exist?('/opt/sophos-av/bin/savdctl')
  sophos_av_settings = {}

  # ExclusionEncodings
  results = `/opt/sophos-av/bin/savconfig query ExclusionEncodings`.split("\n")
  sophos_av_settings[:ExclusionEncodings] = results

  # ExcludeFilePaths
  results = `/opt/sophos-av/bin/savconfig query ExcludeFilePaths`.split("\n")
  sophos_av_settings[:ExcludeFilePaths] = results

  # ExcludeFileOnGlob
  results = `/opt/sophos-av/bin/savconfig query ExcludeFileOnGlob`.split("\n")
  sophos_av_settings[:ExcludeFileOnGlob] = results

  # ExcludeFilesystems
  results = `/opt/sophos-av/bin/savconfig query ExcludeFilesystems`.split("\n")
  sophos_av_settings[:ExcludeFilesystems] = results

  Facter.add(:sophos_av_settings) do
    setcode do
      sophos_av_settings
    end
  end
end
