require 'capybara/dsl'

class WebsitesController < ApplicationController
    include Capybara::DSL

    before_action :set_website

    def show
        if @website.present?
            Capybara.run_server = false
            Capybara.current_driver = :selenium_chrome_headless
            Capybara.app_host = @website
            visit @website
            page.save_screenshot
        end
    end

    private

        def set_website
            @website = params[:website]
        end
end
