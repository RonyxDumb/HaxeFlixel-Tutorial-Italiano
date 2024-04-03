package;

import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxCamera;
import openfl.Assets;
import lime.app.Application;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import openfl.display.FPS;
import openfl.Lib;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxGame;
import openfl.display.Sprite;
/**
	autore@ RonyxDumb
**/
class Main extends Sprite
{
	// IL GIOCO
	var game:FlxGame; // il gioco a sè
	var gameWidht:Int = ; // grandezza schermo
	var gameHeight:Int = ; // grandezza schermo
	var FPS:FPS; // fps
	var skipSplash:Bool = /*true || false*/; // scegli se saltare o meno l'intro di HaxeFlixel
	var initialState:Class<FlxState> = ; // inserisci qui lo state con cui inizia il gioco
	var framerate:Int = ; // inserisci a quanti frame dovrebbe girare il gioco
	public static var focusMusicTween:FlxTween; // musica che si dissolve all'uscita dalla finestra
	private var camera:FlxCamera; // la camera del gioco

	public function new()
	{
		super();

		// Imposta il gioco
		setupGame();
	}

	// elabora "Main"
	public function main():Void
	{
		Lib.current.addChild(new Main());
	}

	// imposta alcune cose del gioco
	private function setupGame():Void
	{
		// il gioco
		game = new FlxGame(gameWidht, gameHeight, initialState, framerate, framerate, true, false);
		addChild(game);

		// grandezza schermo
		var stageHeight:Int = Lib.current.stage.stageHeight;
		var stageWidht:Int = Lib.current.stage.stageWidth;

		// caratteristiche a schermo
		FPS = new FPS(10, 10, FlxColor.WHITE);
		addChild(FPS);

		// carica tutti i suoni all'avvio
		FlxG.sound.cacheAll(); // usa un più di memoria da parte del dispositivo

		/////////////////////// OTTIMIZZAZIONE ////////////////////
		// PS credo che consumi più memoria, ma dovrebbe reggere

		// FALSO
		// autopausa quando si esce dall'app?
		FlxG.autoPause = ; // scegli se quando si esce dall'app, viene messa in pausa

		// CARICA E PULISCI
		
		// musica
		Assets.cache.clear("music");
		Assets.cache.clear("assets/music");

		// immagini
		Assets.cache.clear("images");
		Assets.cache.clear("assets/images");

		// suoni
		// i suoni vengono già caricati con la funzione:
		// "FlxG.sound.cacheAll();"

		///////////////////////////////////////////////////////////
	}

	// transizione per quando esci da uno State
	public static function switchState(target:FlxState)
	{	
		FlxG.switchState(target);
	}

	// funzione che riavvia l'app
	public static function riavvioAPP()
	{
		FlxG.resetGame();
	}
}
