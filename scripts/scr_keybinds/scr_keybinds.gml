function initializeKeybinds() {
	with (obj_input) {
		keybinds = [
			new BindKB("Right", vk_right),
			new BindKB("Left", vk_left),
			new BindKB("Up", vk_up),
			new BindKB("Down", vk_down),
			new BindKB("Confirm", vk_enter),
			new BindKB("Dash", vk_space),
			new BindKB("Jump", vk_up),
			new BindKB("Pause", vk_escape),
			new BindKB("Retry", ord("R")),
			new BindKB("Restart", ord("E")),
			
			new BindGPB("RightGPB", gp_padr),
			new BindGPB("LeftGPB", gp_padl),
			new BindGPB("UpGPB", gp_padu),
			new BindGPB("DownGPB", gp_padd),
			new BindGPB("ConfirmGP", gp_start),
			new BindGPB("DashGP", gp_shoulderrb),
			new BindGPB("JumpGP", gp_face1),
			new BindGPB("PauseGP", gp_select),
			new BindGPB("RetryGP", gp_face4),
			new BindGPB("RestartGP", gp_face3),
			new BindGPA("RightGP", gp_axislh, 0.3),
			new BindGPA("LeftGP", gp_axislh, -0.3),
			new BindGPA("UpGP", gp_axislv, -0.3),
			new BindGPA("DownGP", gp_axislv, 0.3),
		];
	}
}
	
function keybindings() {
	// keyboard
	global.Right = inputCheckHeld("Right");
	global.Left = inputCheckHeld("Left");
	global.Up = inputCheckPressed("Up");
	global.Down = inputCheckPressed("Down");
	global.Confirm = inputCheckPressed("Confirm");
	global.Dash = inputCheckPressed("Dash");
	global.Jump = inputCheckPressed("Jump");
	global.ESC = inputCheckPressed("Pause");
	global.Retry = inputCheckPressed("Retry");
	global.Restart = inputCheckPressed("Restart");
	global.Jumpheld = inputCheckHeld("Jump");
	global.Upheld = inputCheckHeld("Up");
	global.Downheld = inputCheckHeld("Down");
	// controller
	global.RightGP = inputCheckHeld("RightGP");
	global.LeftGP = inputCheckHeld("LeftGP");
	global.UpGP = inputCheckPressed("UpGP");
	global.DownGP = inputCheckPressed("DownGP");
	global.ConfirmGP = inputCheckPressed("ConfirmGP");
	global.DashGP = inputCheckPressed("DashGP");
	global.JumpGP = inputCheckPressed("JumpGP");
	global.ESCGP = inputCheckPressed("PauseGP");
	global.RetryGP = inputCheckPressed("RetryGP");
	global.RestartGP = inputCheckPressed("RestartGP");
	global.JumpheldGP = inputCheckHeld("JumpGP");
	global.RightGPB = inputCheckHeld("RightGPB");
	global.LeftGPB = inputCheckHeld("LeftGPB");
	global.UpGPB = inputCheckPressed("UpGPB");
	global.DownGPB = inputCheckPressed("DownGPB");
	global.UpheldGPB = inputCheckHeld("UpGPB");
	global.DownheldGPB = inputCheckHeld("DownGPB");
	global.UpheldGP = inputCheckHeld("UpGP");
	global.DownheldGP = inputCheckHeld("DownGP");
}