# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Pedals" do
    describe "Admin" do
      describe "pedals" do
        refinery_login_with :refinery_user

        describe "pedals list" do
          before do
            FactoryGirl.create(:pedal, :name => "UniqueTitleOne")
            FactoryGirl.create(:pedal, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.pedals_admin_pedals_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.pedals_admin_pedals_path

            click_link "Add New Pedal"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Pedals::Pedal.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Pedals::Pedal.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:pedal, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.pedals_admin_pedals_path

              click_link "Add New Pedal"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Pedals::Pedal.count.should == 1
            end
          end

          context "with translations" do
            before do
              Refinery::I18n.stub(:frontend_locales).and_return([:en, :cs])
            end

            describe "add a page with title for default locale" do
              before do
                visit refinery.pedals_admin_pedals_path
                click_link "Add New Pedal"
                fill_in "Name", :with => "First column"
                click_button "Save"
              end

              it "should succeed" do
                Refinery::Pedals::Pedal.count.should == 1
              end

              it "should show locale flag for page" do
                p = Refinery::Pedals::Pedal.last
                within "#pedal_#{p.id}" do
                  page.should have_css("img[src='/assets/refinery/icons/flags/en.png']")
                end
              end

              it "should show name in the admin menu" do
                p = Refinery::Pedals::Pedal.last
                within "#pedal_#{p.id}" do
                  page.should have_content('First column')
                end
              end
            end

            describe "add a pedal with title for primary and secondary locale" do
              before do
                visit refinery.pedals_admin_pedals_path
                click_link "Add New Pedal"
                fill_in "Name", :with => "First column"
                click_button "Save"

                visit refinery.pedals_admin_pedals_path
                within ".actions" do
                  click_link "Edit this pedal"
                end
                within "#switch_locale_picker" do
                  click_link "Cs"
                end
                fill_in "Name", :with => "First translated column"
                click_button "Save"
              end

              it "should succeed" do
                Refinery::Pedals::Pedal.count.should == 1
                Refinery::Pedals::Pedal::Translation.count.should == 2
              end

              it "should show locale flag for page" do
                p = Refinery::Pedals::Pedal.last
                within "#pedal_#{p.id}" do
                  page.should have_css("img[src='/assets/refinery/icons/flags/en.png']")
                  page.should have_css("img[src='/assets/refinery/icons/flags/cs.png']")
                end
              end

              it "should show name in backend locale in the admin menu" do
                p = Refinery::Pedals::Pedal.last
                within "#pedal_#{p.id}" do
                  page.should have_content('First column')
                end
              end
            end

            describe "add a name with title only for secondary locale" do
              before do
                visit refinery.pedals_admin_pedals_path
                click_link "Add New Pedal"
                within "#switch_locale_picker" do
                  click_link "Cs"
                end

                fill_in "Name", :with => "First translated column"
                click_button "Save"
              end

              it "should show title in backend locale in the admin menu" do
                p = Refinery::Pedals::Pedal.last
                within "#pedal_#{p.id}" do
                  page.should have_content('First translated column')
                end
              end

              it "should show locale flag for page" do
                p = Refinery::Pedals::Pedal.last
                within "#pedal_#{p.id}" do
                  page.should have_css("img[src='/assets/refinery/icons/flags/cs.png']")
                end
              end
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:pedal, :name => "A name") }

          it "should succeed" do
            visit refinery.pedals_admin_pedals_path

            within ".actions" do
              click_link "Edit this pedal"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:pedal, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.pedals_admin_pedals_path

            click_link "Remove this pedal forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Pedals::Pedal.count.should == 0
          end
        end

      end
    end
  end
end
