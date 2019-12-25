class ApplicationController < ActionController::Base

    def hello
        reder html: "hello,world"
    end

end
