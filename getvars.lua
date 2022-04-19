-- Watch the video: https://youtu.be/YtZuyrJNcMg

function main ()
  gma.feedback(gma.show.getvar('SELECTEDEXEC'))
  gma.feedback(gma.show.getvar('FEATURE'))
  gma.feedback(gma.show.getvar('FADERPAGE'))
  gma.feedback(gma.show.getvar('BUTTONPAGE'))
  gma.feedback(gma.show.getvar('CHANNELPAGE'))
  gma.feedback(gma.show.getvar('SELECTEDEXECCUE'))
  gma.feedback(gma.show.getvar('SELECTEDFIXTURESCOUNT'))

  gma.show.setvar('joke', 'What is a byte\'s favorite activity? Riding the bus')
  gma.cmd('listvar')
end

return main
