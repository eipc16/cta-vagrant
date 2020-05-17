import React, {useState} from 'react';
import Search from "antd/es/input/Search";
import {DatePicker, Pagination, Select} from "antd";
import {connect, useDispatch} from "react-redux";
import {GenreActionPublisherImpl} from "../../../redux/actions/genre/actions";
import {Genre} from "../../../models/genre";
import {GenreServiceImpl} from "../../../services/genre-service";
import {useFetching} from "../../../utils/custom-fetch-hook";
import {MovieListFilters} from "../../../models/movies-list";
import {MovieListActionPublisher} from "../../../redux/actions/movie-list";
import moment from 'moment';

import './movie-list-filters.scss';

const {Option} = Select;
const {RangePicker} = DatePicker;

interface OwnProps {
    movieListActionPublisher: MovieListActionPublisher;
    totalPages: number;
    children?: React.ReactNode;
}

interface State {
    genreFetched: boolean,
    genreFetching: boolean,
    genres: Genre[],
    totalGenres: number,
    filters: MovieListFilters
}

enum FiltersEnum {
    SEARCH_TEXT = "searchText",
    DATARANGE = "dateRange",
    GENRES = "genres",
    PAGE = "page"
}

export type MovieListFiltersProps = OwnProps & State;

export const MovieListFiltersComponent = (props: MovieListFiltersProps) => {
    const {genres, totalGenres, genreFetching, movieListActionPublisher, filters, totalPages, children} = props;
    const dispatch = useDispatch()

    // State holders
    let searchText = filters.searchText;
    let dateRange = filters.dateRange;
    let selectedGenres = filters.genres;
    let currentPage = filters.currentPage;

    const [genreService,] = useState(GenreServiceImpl.createInstance());
    const [genrePublisher,] = useState(new GenreActionPublisherImpl(genreService));

    const handleDatePicker = (value: any) => {
        const newRange = {
            beginDate: value[0].valueOf(),
            endDate: value[1].valueOf()
        }
        dateRange = newRange;
        updateFilters(FiltersEnum.DATARANGE, newRange);
    }

    const handleGenreSelect = (value: string[]) => {
        selectedGenres = value;
        updateFilters(FiltersEnum.GENRES, value);
    }

    const handleSearchText = (e: React.ChangeEvent) => {
        const value = (e.target as HTMLInputElement).value;
        const finalSearchText = value ? value : "";
        searchText = finalSearchText;
        updateFilters(FiltersEnum.SEARCH_TEXT, finalSearchText);
    }

    const handlePage = (page: number) => {
        const selectedPage = page - 1;
        currentPage = selectedPage
        updateFilters(FiltersEnum.PAGE, selectedPage);
    }

    const updateFilters = (lastUpdated: FiltersEnum, value: any) => {
        dispatch(movieListActionPublisher.updateFilters({
            dateRange: dateRange,
            searchText: searchText,
            genres: selectedGenres,
            currentPage: 0,
            [lastUpdated.toString()]: value
        }))
    }

    const getPlaceHolder = (totalGenres: number) => {
        if (totalGenres < 1) {
            return 'No genres';
        }
        return `Select genre. Total genres: ${totalGenres}`
    }

    useFetching(genrePublisher.fetchGenres())

    return (
        <div className='movie--list-filters'>
            <div className='top--filters--controls'>
                <div className='input--container title--input'>
                    <label className='input--label' htmlFor='title--input'>Title:</label>
                    <Search
                        id='title--input'
                        placeholder="Movie title"
                        enterButton="Search"
                        className='search--text--input'
                        size="large"
                        onChange={handleSearchText}
                    />
                </div>
                <div className='input--container'>
                    <label className='input--label' htmlFor='date--picker'>Date:</label>
                    <RangePicker
                        id='date--picker'
                        className='date--picker--input'
                        defaultValue={[
                            moment(dateRange.beginDate).utc(),
                            moment(dateRange.endDate).utc()
                        ]}
                        onChange={handleDatePicker}
                        showTime
                    />
                </div>
                <div className='input--container'>
                    <label className='input--label' htmlFor='genre--picker'>Genre:</label>
                    <Select
                        id='genre--picker'
                        mode="multiple"
                        className='genre--picker--input'
                        placeholder={getPlaceHolder(totalGenres)}
                        onChange={handleGenreSelect}
                    >
                        {
                            genreFetching ? "Fetching genres..." :
                                genres.map(genre => <Option key={genre.name} value={genre.name}>{genre.name}</Option>)
                        }
                    </Select>
                </div>
            </div>
            {children}
            <Pagination className='pagination--selector' defaultCurrent={1} total={totalPages} onChange={handlePage}/>
        </div>
    )
}

const mapStateToProps = (state: any, ownProps: OwnProps) => ({
    genreFetched: state.genres.isFetched,
    genreFetching: state.genres.isFetching,
    genres: state.genres.genreList,
    totalGenres: state.genres.totalGenres,
    filters: state.movieList.filters,
    ...ownProps
})

export const MovieListFiltersContainer: React.FC<OwnProps> = connect(mapStateToProps)(MovieListFiltersComponent)
