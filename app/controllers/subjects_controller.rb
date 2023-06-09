class SubjectsController < ApplicationController
    before_action :move_to_index, except: [:index, :show, :search]
    before_action :authenticate_user!
    before_action :set_subject, only: [:show, :edit, :update]

    def index
        if params[:subject_name]
            @subjects = Subject.subject_name(params[:subject_name])
            if params[:latest]
                @subjects = @subjects.latest
            elsif params[:old]
                @subjects = @subjects.old
            elsif params[:subject_id]
                @subjects = @subjects.subject_id
            elsif params[:month_id]
                @subjects = @subjects.month_id
            elsif params[:grade_id]
                @subjects = @subjects.grade_id
            end
        elsif params[:latest]
            @subjects = Subject.latest
        elsif params[:old]
            @subjects = Subject.old
        elsif params[:subject_id]
            @subjects = Subject.subject_id
        elsif params[:month_id]
            @subjects = Subject.month_id
        elsif params[:grade_id]
            @subjects = Subject.grade_id
        else
            @subjects = Subject.includes(:user)
        end
    end

    def new
        @subject = Subject.new
    end

    def create
        @subject = Subject.new(subject_params)
        if @subject.save
            redirect_to(subjects_path)
        else
            render(:new)
        end
    end

    def show
    end

    def edit
    end

    def update
        if @subject.update(subject_params)
            flash[:notice] = "投稿内容を更新しました。"
            redirect_to(subjects_path)
        else
            render :edit
        end
    end
    
    def destroy
        Subject.find(params[:id]).destroy
        flash[:notice] = "投稿を削除しました。"
        redirect_to(subjects_path)
    end

    def search
        keyword_subjects = Subject.search(params[:keyword])
        if params[:latest]
            @subjects = keyword_subjects.latest
        elsif params[:old]
            @subjects = keyword_subjects.old
        elsif params[:subject_id]
            @subjects = keyword_subjects.subject_id
        elsif params[:month_id]
            @subjects = keyword_subjects.month_id
        elsif params[:grade_id]
            @subjects = keyword_subjects.grade_id
        else
            @subjects = keyword_subjects.includes(:user)
        end
    end

    private
    def subject_params
        params.require(:subject).permit(:subject_id, :sub_subject, :title, :month_id, :grade_id, :name, :content, :file).merge(user_id: current_user.id)
    end

    def move_to_index
        unless user_signed_in?
            redirect_to action: :index
        end
    end

    def set_subject
        @subject = Subject.find(params[:id])
    end

end
