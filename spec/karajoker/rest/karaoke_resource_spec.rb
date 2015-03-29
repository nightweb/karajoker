require 'spec_helper'

module Karajoker
  module Rest
    describe KaraokeResource do
      include RestTestUtils

      describe "'POST'" do
        let(:karaoke_params) { { title: 'hello', youtube_id: '1234', tags: [:pop] } }
        before { create(:tag, :pop) }
        it "add a hello karaoke tag as pop" do
          http_post karaoke_params

          # Assert
          expect(response.status).to eq 201
          expect(Karaoke.first.title).to eq karaoke_params[:title]
          expect(Karaoke.first.youtube_id).to eq karaoke_params[:youtube_id]
          expect(Karaoke.first.tags.first.name.downcase).to eq karaoke_params[:tags].first.to_s
        end
      end

      describe "'GET'" do
        it "list all karaokes" do
          # Prepare
          videos = [create(:karaoke, :hello_1), create(:karaoke, :hello_2)]

          # Perform
          http_get

          # Asserts
          results = response_boby
          expect(response.status).to eq 200
          expect(results.first.title).to eq videos.first.title
          expect(results.second.title).to eq videos.second.title
        end

        it "find karaoke hello_1" do
          # Prepare
          videos = [create(:karaoke, :hello_1), create(:karaoke, :hello_2)]

          # Perform
          http_get "/search/#{videos.first.title}"

          # Asserts
          results = response_boby
          expect(response.status).to eq 200
          expect(results.first.title).to eq videos.first.title
        end
      end

      describe "'DELETE'" do
        it "remove karaoke hello_1" do
          # Prepare
          video = create :karaoke, :hello_1

          # Perform
          http_delete video.id

          # Asserts
          expect(response.status).to eq 200
          expect(Karaoke.all.empty?).to eq true
        end
      end

      protected

      def url
        :karaokes
      end

    end
  end
end
