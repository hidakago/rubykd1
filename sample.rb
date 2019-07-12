# ① player = Player.newの記述の意味
# クラス"Player"をnewメソッドでインスタンス化したものを変数"player"に代入している。
# ② 大文字の"Player"と小文字の"player"の違い
# クラス名は通常先頭の文字を大文字にする。
# この課題の場合だと、大文字の"Player"はクラス名、小文字の"player"はクラス"Player"をインスタンス化したものを代入するための変数。
class Player
  def hand
    while true
      # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
      puts "これからじゃんけんゲームを行います。0、1、2のいずれかの数字を入力してください。"
      puts "「0」はグー、"
      puts "「1」はチョキ、"
      puts "「2」はパー"
      puts "です。"

      number = gets.chomp

      #もし入力値が0でも1でも2でもない場合
      if number != "0" && number != "1" && number != "2"
        puts "0〜2の数字を入力してください。"
      else
        #入力値を返す
        return number.to_i
      end
    end
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    #0から2までの乱数を生成して返す
    rand(3)
  end
end

class Janken
  attr_accessor :result
  def initialize
    @result = ["グー","チョキ","パー"]
  end
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる

    puts "プレイヤー:#{@result[player_hand]}"
    puts "相手:#{@result[enemy_hand]}"

    #もし「あいこ」だった場合は再度じゃんけん
    if player_hand == enemy_hand
      puts "あいこです。"
      #再度じゃんけん
      player = Player.new
      enemy = Enemy.new
      janken = Janken.new
      janken.pon(player.hand, enemy.hand)
    else
      #自分が勝った場合
      if ((player_hand - enemy_hand + 3) % 3) == 2
        puts "あなたの勝ちです！"
      else
        puts "あなたの負けです！"
      end
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)
