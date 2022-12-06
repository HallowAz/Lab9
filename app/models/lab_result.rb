require '/home/amigo/Study/Yaip/Labs/Lab9/lab9/app/controllers/lab_controller.rb'

class LabResult
    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :numb

    validates :numb, presence: { message: 'не может быть пустым'}
    validates :numb, format: { with: /\d/, message: 'должно быть числом'}

    def result
        LabHelper.palin([@numb])
    end
end