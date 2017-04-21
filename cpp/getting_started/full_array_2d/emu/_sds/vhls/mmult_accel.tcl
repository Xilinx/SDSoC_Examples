set_directive_interface -mode m_axi -offset direct "mmult_accel" b -bundle=b
set_directive_interface -mode m_axi -offset direct "mmult_accel" c -bundle=c
set_directive_interface -mode m_axi -offset direct "mmult_accel" a -bundle=a
set_directive_latency -min 1 mmult_accel
