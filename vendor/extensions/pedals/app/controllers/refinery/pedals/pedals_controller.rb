module Refinery
  module Pedals
    class PedalsController < ::ApplicationController

      before_filter :find_all_pedals
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pedal in the line below:
        present(@page)
      end

      def show
        @pedal = Pedal.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @pedal in the line below:
        present(@page)
      end

    protected

      def find_all_pedals
        @pedals = Pedal.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/pedals").first
      end

    end
  end
end
