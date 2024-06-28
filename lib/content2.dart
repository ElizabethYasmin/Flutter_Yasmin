import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Content2 extends StatelessWidget {
  const Content2({Key? key}) : super(key: key);

  void _showImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      body: Stack(
        children: [
          Positioned(
            top: 70,
            left: 100,
            child: Text(
              'time is relative right?',
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                'SPIDER-MAN',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: 80,
            child: GestureDetector(
              onTap: () => _showImage(context, 'assets/img/img1.jpg'),
              child: Image.asset('assets/img/img1.jpg', width: 100, height: 100),
            ),
          ),
          Positioned(
            top: 110,
            left: 150,
            child: GestureDetector(
              onTap: () => _showImage(context, 'assets/img/img2.jpg'),
              child: Image.asset('assets/img/img2.jpg', width: 100, height: 100),
            ),
          ),
          Positioned(
            top: 220,
            left: 100,
            child: GestureDetector(
              onTap: () => _showImage(context, 'assets/img/img3.jpg'),
              child: Image.asset('assets/img/img3.jpg', width: 100, height: 60),
            ),
          ),
          Positioned(
            top: 80,
            left: 240,
            child: GestureDetector(
              onTap: () => _showImage(context, 'assets/img/img4.jpg'),
              child: Image.asset('assets/img/img4.jpg', width: 100, height: 200),
            ),
          ),
          Positioned(
            top: 310,
            left: 80,
            child: GestureDetector(
              onTap: () => _showImage(context, 'assets/img/img5.jpg'),
              child: Image.asset('assets/img/img5.jpg', width: 120, height: 120),
            ),
          ),
          Positioned(
            top: 460,
            left: 50,
            child: GestureDetector(
              onTap: () => _showImage(context, 'assets/img/img6.jpg'),
              child: Image.asset('assets/img/img6.jpg', width: 150, height: 200),
            ),
          ),
          Positioned(
            top: 210,
            right: 10,
            
              child: Container(
                width: 250,
                height: 250,
                child: Image.asset('assets/S2.gif'), // Reemplaza con la ruta de tu GIF
              ),
            ),
          
          Positioned(
            bottom: 20,
            right: 10,
            child: MusicPlayer(),
          ),
        ],
      ),
    );
  }
}

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _duration = Duration();
  Duration _position = Duration();

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
/*     _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    }); */
/*     _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });  */
  }




@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Verificar si se está reproduciendo al cambiar de vista y pausar si es necesario
    if (_isPlaying) {
      _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
      });
    }
  }

  void _playPause() {
    if (!_isPlaying) {
      _audioPlayer.play(AssetSource('audio/spidervers.mp3'));
    } else {
      _audioPlayer.pause();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  String _formatDuration(Duration d) {
    return d.toString().split('.').first.padLeft(8, "0");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: const Color.fromARGB(137, 202, 190, 190),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/img/img11.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            'Para Fernando',
            style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text(
            'Anonimo',
            style: TextStyle(color: Colors.white70, fontSize: 14.0),
          ),
          SizedBox(height: 10.0),
          Slider(
            value: _position.inSeconds.toDouble(),
            min: 0.0,
            max: _duration.inSeconds.toDouble(),
            onChanged: (double value) {
              setState(() {
                _audioPlayer.seek(Duration(seconds: value.toInt()));
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _formatDuration(_position),
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  _formatDuration(_duration),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.skip_previous, color: Colors.white, size: 24.0),
                onPressed: () {
                  // Implement skip previous functionality
                },
              ),
              IconButton(
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white, size: 32.0),
                onPressed: _playPause,
              ),
              IconButton(
                icon: Icon(Icons.skip_next, color: Colors.white, size: 24.0),
                onPressed: () {
                  // Implement skip next functionality
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
