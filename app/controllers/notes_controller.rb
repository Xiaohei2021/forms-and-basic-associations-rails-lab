class SongsController < ApplicationController
    def index
      @notes = Note.all
    end