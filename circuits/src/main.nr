struct game_state{
    move_1: u4,
    move_2: u4,
    hashed_move_1: pub Field,
    hashed_move_2: pub Field,
    winner: u4,
    salt: u32,
}

impl game_state {
    fn new(game_id: u32) -> game_state {
        game_state {            
           //move_1: 0,
           //move_2: 0,
           //hashed_move_1: 0,
           //hashed_move_2: 0,
           //winner: 0, 
           //salt: 0,
        }
    }

    fn player_move(game_id: u32, hashed_move: Field){
        let _hashed_move_1 = hashed_move_1
        constrain hashed_move != 0
        constrain hashed_move_1 != hashed_move
        //if _player_1 == 0 {
        //    let game_state.player_1 = sender
        //    let game_state.hashed_move_1 = hashed_move
        //} else {}

    }

    fn view_game(game_id: u32) {
        unimplemented!;
    }

    fn view_move(game_id: u32, move: u32){
        unimplemented!;
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

