# Debian NoVNC dengan Sound Support

Docker image untuk remote desktop Debian dengan NoVNC (port 8080) dan dukungan sound.

## Cara Menggunakan

1. Build image:
   ```bash
   docker build -t debian-novnc-sound .


   docker run -d -p 8080:8080 -p 5900:5900 \
  -e PULSE_SERVER=tcp:localhost:4713 \
  --device /dev/snd \
  --name my-novnc \
  debian-novnc-sound


  
## Tips Tambahan

1. Untuk mengoptimalkan ukuran image, pertimbangkan untuk menggunakan multi-stage build
2. Anda bisa menambahkan lebih banyak aplikasi dengan menambahkannya di bagian `apt-get install`
3. Untuk keamanan, tambahkan password VNC dengan mengubah parameter x11vnc di start.sh

Semoga membantu! Jika ada pertanyaan lebih lanjut, jangan ragu untuk bertanya.
