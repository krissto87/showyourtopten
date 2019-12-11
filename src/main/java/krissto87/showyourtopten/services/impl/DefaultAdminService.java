package krissto87.showyourtopten.services.impl;

import krissto87.showyourtopten.domain.entities.Movie;
import krissto87.showyourtopten.domain.entities.Serial;
import krissto87.showyourtopten.domain.repositories.MovieRepository;
import krissto87.showyourtopten.domain.repositories.SerialRepository;
import krissto87.showyourtopten.dtos.AddMovieDTO;
import krissto87.showyourtopten.dtos.AddSerialDTO;
import krissto87.showyourtopten.dtos.EditMovieDTO;
import krissto87.showyourtopten.services.AdminService;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class DefaultAdminService implements AdminService {

    private ModelMapper mapper = new ModelMapper();
    private MovieRepository movieRepository;
    private SerialRepository serialRepository;

    public DefaultAdminService(MovieRepository movieRepository, SerialRepository serialRepository) {
        this.movieRepository = movieRepository;
        this.serialRepository = serialRepository;
    }

    @Override
    public void addMovie(AddMovieDTO addMovieDTO) {
        Movie movie = mapper.map(addMovieDTO, Movie.class);
        movieRepository.save(movie);
    }

    @Override
    public List<Movie> findAll() {
        return movieRepository.findAll();
    }

    @Override
    public EditMovieDTO findById(Long id) {
        Optional<Movie> result = movieRepository.findById(id);
        Movie movie = result.get();
        EditMovieDTO movieDTO = mapper.map(movie, EditMovieDTO.class);
        return movieDTO ;
    }

    @Override
    public void save(EditMovieDTO movieDTO) {
        Movie movie = mapper.map(movieDTO, Movie.class);
        movieRepository.save(movie);
    }

    @Override
    public void deleteById(Long id) {
        movieRepository.deleteById(id);
    }

    @Override
    public void addSerial(AddSerialDTO addSerialDTO) {
        Serial serial = mapper.map(addSerialDTO, Serial.class);
        serialRepository.save(serial);
    }
}
