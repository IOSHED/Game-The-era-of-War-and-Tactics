use core_domain::{grid::Grid, settings::Settings, types::Dim};
use macroquad::prelude::*;

#[macroquad::main("Эпоха Войны и Тактики")]
async fn main() {
    loop {
        clear_background(RED);

        draw_line(40.0, 40.0, 100.0, 200.0, 15.0, BLUE);
        draw_rectangle(screen_width() / 2.0 - 60.0, 100.0, 120.0, 60.0, GREEN);
        draw_circle(screen_width() - 30.0, screen_height() - 30.0, 15.0, YELLOW);
        draw_text("HELLO", 20.0, 20.0, 20.0, DARKGRAY);

        let settings = Settings {
            grid_size: Dim::new(4, 4),
        };
        let grid = Grid::new(settings.grid_size);
        println!("{}", grid);

        next_frame().await
    }
}
