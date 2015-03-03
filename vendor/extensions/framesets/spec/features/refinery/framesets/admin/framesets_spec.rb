# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Framesets" do
    describe "Admin" do
      describe "framesets" do
        refinery_login_with :refinery_user

        describe "framesets list" do
          before do
            FactoryGirl.create(:frameset, :name => "UniqueTitleOne")
            FactoryGirl.create(:frameset, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.framesets_admin_framesets_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.framesets_admin_framesets_path

            click_link "Add New Frameset"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Framesets::Frameset.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Framesets::Frameset.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:frameset, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.framesets_admin_framesets_path

              click_link "Add New Frameset"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Framesets::Frameset.count.should == 1
            end
          end

          context "with translations" do
            before do
              Refinery::I18n.stub(:frontend_locales).and_return([:en, :cs])
            end

            describe "add a page with title for default locale" do
              before do
                visit refinery.framesets_admin_framesets_path
                click_link "Add New Frameset"
                fill_in "Name", :with => "First column"
                click_button "Save"
              end

              it "should succeed" do
                Refinery::Framesets::Frameset.count.should == 1
              end

              it "should show locale flag for page" do
                p = Refinery::Framesets::Frameset.last
                within "#frameset_#{p.id}" do
                  page.should have_css("img[src='/assets/refinery/icons/flags/en.png']")
                end
              end

              it "should show name in the admin menu" do
                p = Refinery::Framesets::Frameset.last
                within "#frameset_#{p.id}" do
                  page.should have_content('First column')
                end
              end
            end

            describe "add a frameset with title for primary and secondary locale" do
              before do
                visit refinery.framesets_admin_framesets_path
                click_link "Add New Frameset"
                fill_in "Name", :with => "First column"
                click_button "Save"

                visit refinery.framesets_admin_framesets_path
                within ".actions" do
                  click_link "Edit this frameset"
                end
                within "#switch_locale_picker" do
                  click_link "Cs"
                end
                fill_in "Name", :with => "First translated column"
                click_button "Save"
              end

              it "should succeed" do
                Refinery::Framesets::Frameset.count.should == 1
                Refinery::Framesets::Frameset::Translation.count.should == 2
              end

              it "should show locale flag for page" do
                p = Refinery::Framesets::Frameset.last
                within "#frameset_#{p.id}" do
                  page.should have_css("img[src='/assets/refinery/icons/flags/en.png']")
                  page.should have_css("img[src='/assets/refinery/icons/flags/cs.png']")
                end
              end

              it "should show name in backend locale in the admin menu" do
                p = Refinery::Framesets::Frameset.last
                within "#frameset_#{p.id}" do
                  page.should have_content('First column')
                end
              end
            end

            describe "add a name with title only for secondary locale" do
              before do
                visit refinery.framesets_admin_framesets_path
                click_link "Add New Frameset"
                within "#switch_locale_picker" do
                  click_link "Cs"
                end

                fill_in "Name", :with => "First translated column"
                click_button "Save"
              end

              it "should show title in backend locale in the admin menu" do
                p = Refinery::Framesets::Frameset.last
                within "#frameset_#{p.id}" do
                  page.should have_content('First translated column')
                end
              end

              it "should show locale flag for page" do
                p = Refinery::Framesets::Frameset.last
                within "#frameset_#{p.id}" do
                  page.should have_css("img[src='/assets/refinery/icons/flags/cs.png']")
                end
              end
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:frameset, :name => "A name") }

          it "should succeed" do
            visit refinery.framesets_admin_framesets_path

            within ".actions" do
              click_link "Edit this frameset"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:frameset, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.framesets_admin_framesets_path

            click_link "Remove this frameset forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Framesets::Frameset.count.should == 0
          end
        end

      end
    end
  end
end
