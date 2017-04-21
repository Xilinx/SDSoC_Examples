set_directive_interface -mode m_axi -offset direct "mean_value_accel" out -bundle=out
set_directive_interface -mode m_axi -offset direct "mean_value_accel" in -bundle=in
set_directive_latency -min 1 mean_value_accel
