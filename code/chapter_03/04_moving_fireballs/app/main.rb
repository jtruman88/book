def tick args
  args.state.player_x ||= 120
  args.state.player_y ||= 280
  args.state.fireballs ||= []

  speed = 12
  player_w = 100
  player_h = 80

  if args.inputs.left
    args.state.player_x -= speed
  elsif args.inputs.right
    args.state.player_x += speed
  end

  if args.inputs.up
    args.state.player_y += speed
  elsif args.inputs.down
    args.state.player_y -= speed
  end

  if args.state.player_x +  player_w > args.grid.w
    args.state.player_x = args.grid.w - player_w
  end

  if args.state.player_x < 0
    args.state.player_x = 0
  end

  if args.state.player_y + player_h > args.grid.h
    args.state.player_y = args.grid.h - player_h
  end

  if args.state.player_y < 0
    args.state.player_y = 0
  end

  if args.inputs.keyboard.key_down.z ||
      args.inputs.keyboard.key_down.j ||
      args.inputs.controller_one.key_down.a
    args.state.fireballs << [args.state.player_x, args.state.player_y, 'fireball']
  end

  args.state.fireballs.each do |fireball|
    fireball[0] += speed + 2
  end

  args.outputs.labels << args.state.fireballs

  args.outputs.sprites << [args.state.player_x, args.state.player_y, player_w, player_h, 'sprites/misc/dragon-0.png']
end
