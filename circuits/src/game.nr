use dep::std;

//PARAMS:
//@param move_1: unhashed move   
//@param move_2: unhashed move
//@param hashed_move_1: hashed move that is field element
//@param hashed_move_2: hashed move that is field element
//@param winner: computed winner from computing both moves
//@param salt: salt for computing hash

struct game {
    player_1: Field,
    Player_2: Field,
    move_1: u4,
    move_2: u4,
    hashed_move_1: Field,
    hashed_move_2: Field,
    winner: u4,
    salt: u32,
}

impl game {
    fn new() -> Self {
        Self {           
           player_1: 0 as u4,
           player_2: 0 as u4,
           move_1: 0,
           move_2: 0,
           hashed_move_1: 0 as u4,
           hashed_move_2: 0 as u4,
           winner: 0, 
           salt: 0,
        }
    }

    fn player_move(self, _hashed_move: Field, from: Field){
        constrain _hashed_move != 0
        constrain self.hashed_move_1 != _hashed_move
        //So basically we check that _hashed_move isn't zero
        //then check that any previous move isn't same as _hashed_move
        if self.player_1 == 0:
            self.player_1 = from;
            self.hashed_move_1 = _hashed_move
        else:
            self.player_2 = from;
            self.hashed_move_2 = _hashed_move
    }

    fn view_game(game_id: u32) {
        unimplemented!;
    }

    fn view_move(game_id: u32, move: u32){
        unimplemented!;
    }

    fn hash_move(self, from: Field, move: u4) -> _hashed_move: Field {
        let _hashed_move = std::hash::pedersen([self.salt as Field, move as Field]);
        let _hashed_move = std::hash::pedersen([_hashed_move, from]);
        _hashed_move
    }


//0 = rock
//1 = paper
//2 = scizzors
    fn check_move_winner(move_1: u32, move_2: u32) -> u32{
        if move_1 == move_2{
            0
        }
        else if move_1 + 1 == move_2{
            2
        }
        else if move_1 - 1 == move_2{
            1
        }    
        else if move_1 + 2 == move_2{
            1
        }
        else if move_1 - 2 == move_2{
            2
        }
        else {
            0
        }
    }

    fn finish_game(game_id: u32){
        let winner = check_move_winner(move_1, move_2);
    }
}

