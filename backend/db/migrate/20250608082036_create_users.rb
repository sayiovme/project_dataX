class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true  # email은 유니크하고 널을 허용하지 않음
      t.string :password, null: false            # password는 널을 허용하지 않음
      t.timestamps
    end

    # email 컬럼에 인덱스 추가 (유니크 제약을 적용하기 위해)
    add_index :users, :email, unique: true
  end
end