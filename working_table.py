import psycopg2

class DB:
    def __init__(self,db_name,db_user,db_password,db_host,db_port):
        self.conn = psycopg2.connect(
            database=db_name,
            user=db_user,
            password=db_password,
            host=db_host,
            port=db_port
        )
    def create_table(self):
        '''Создание таблиц users  и   phone'''
        with self.conn.cursor() as cur:
           cur.execute('''
               create table if not exists users(
                   id SERIAL PRIMARY KEY,
                   name VARCHAR(255) NOT NULL,
                   last_name VARCHAR(255) NOT NULL,
                   email varchar(60) unique
               );
           ''')
           cur.execute('''
                   create table if not exists phone(
                       id serial primary key,
                       phone_number varchar(10),
                       users_id int not null references users(id) on delete cascade
                   );
               ''')
           self.conn.commit()

    def drop_table(self):
        '''удаление таблиц'''
        with self.conn.cursor() as cur:
            cur.execute('''
                drop table phone
            ''')
            cur.execute('''
                drop table users
            ''')
            self.conn.commit()

    def check_client(self,email:str)->tuple:
        '''Проверка наличия клиента'''
        with self.conn.cursor() as cur:
            cur.execute('''
                select * from users where email = %s
            ''', (email,))
            answer = cur.fetchone()

            return answer
    def check_phone_number(self,phone:str)->tuple:
        '''Проверка наличия телефона'''
        with self.conn.cursor() as cur:
            cur.execute('''
                select * from phone where phone_number = %s
            ''', (phone,))
            answer = cur.fetchone()

            return answer

    def add_client(self,name:str,last_name:str,email:str):
        '''Создаем клинта'''
        if self.check_client(email):
            return print('такой  email уже существует')
        else:
            with self.conn.cursor() as cur:
                cur.execute('''
                    insert into users(name,last_name,email)
                    values(%s,%s,%s) returning id; 
                ''', (name, last_name, email))
                id_cl = cur.fetchone()
                self.conn.commit()
        print(f'клиенту {name} c почтовым адресом {email} присвоен  id {id_cl[0]}')
        if input('добавить телефон ?(введите любой символ, что бы продолжить)'):

            self.adding_a_phone_number(email,input('введите номер телефона'))



    def adding_a_phone_number(self,email:str,phone_number:str)->str:
        '''Добавление телефона'''
        if self.check_client(email):
            print('такой  клинт  существует')
            if self.check_phone_number(phone_number):
                return print('такой  номер телефона уже существует')
            else:
                with self.conn.cursor() as cur:
                    cur.execute('''
                        insert into phone(phone_number,users_id)
                        values(%s,%s)
                    ''', (phone_number, self.check_client(email)[0]))
                    self.conn.commit()
                return print(f'Телефон {phone_number} клиенту с email {email} добавлен успешно')


        else:
            print('клиент не существует')
    def change_name(self,list:list):
        '''меняем имя клиента'''
        if self.check_client(list[1]):
            with self.conn.cursor() as cur:
                cur.execute('''
                    update users
                    set name = %s
                    where email = %s
                ''', (list[2],list[1]))
                self.conn.commit()
                print(f'клиенту с email {list[1]} изменено имя на {list[2]}')
        else:
            print('клиент не существует')
    def change_last_name(self,list):
        '''меняем фамилию клиента'''
        if self.check_client(list[1]):
            with self.conn.cursor() as cur:
                cur.execute('''
                    update users
                    set last_name = %s
                    where email = %s
                ''', (list[2],list[1]))
                self.conn.commit()
                print(f'клиенту с email {list[1]} изменено фамилию на {list[2]}')





    def change_info(self):
        '''запрашиваем данные о клиенте, которые хотим изменить'''
        print('1 - изменить имя \n2 - изменить фамилию \n3 - изменить email \n4 - изменить телефон')
        resp = input(f'выберите пункт, который хотите изменить и (через пробел ) email пользователя и новые данные').split(' ')
        # print(resp)
        if resp[0] == '1':
            self.change_name(resp)

        if resp[0] == '2':
            self.change_last_name(resp)

        if resp[0] == '3':
            self.change_email(resp)
        if resp[0] == '4':
            self.adding_a_phone_number(resp[1],resp[2])
    def del_phone(self,email:str,phone:str):
        '''Удаление телефона'''
        if self.check_client(email):
            print('такой  клинт  существует')
            if self.check_phone_number(phone):
                with self.conn.cursor() as cur:
                    cur.execute('''
                        delete from phone
                        where phone_number = %s and users_id = %s
                    ''', (phone, self.check_client(email)[0]))
                    self.conn.commit()
                    print(f'Телефон {phone} клиенту с email {email} удален успешно')
            else:
                print('такого номера телефона не существует')

    def del_client(self):
        '''удаление клиента'''
        answer = input('выберите email клиента, которого хотите удалить')
        if self.check_client(answer):
            with self.conn.cursor() as cur:
                cur.execute('''
                    delete from users
                    where email = %s
                ''', (answer,))
                self.conn.commit()
                print(f'клиент с email {answer} удален успешно')

        else:
            print('клиент не существует')


    def find_client_by_name(self,name:str):
        '''поиск клиента по имени'''
        with self.conn.cursor() as cur:
            cur.execute('''
                select * from users where name = %s
            ''', (name[1],))
            answer = cur.fetchone()
        print(" ".join([str(i) for i in answer]))

    def find_client_by_last_name(self,last_name:str):
        '''поиск клиента по фамилии'''
        with self.conn.cursor() as cur:
            cur.execute('''
                select * from users where last_name = %s
            ''', (last_name[1],))
            answer = cur.fetchone()
        print(" ".join([str(i) for i in answer]))

    def find_client(self):
        '''логика поиска клиента по данным'''
        print('1 - по email \n2 - по номеру телефона\n3 - по фамилии\n4 - по имени')
        answer = input('выберите тип данных из списка и,через пробел, введите значение').split(' ')

        if answer[0] == '1':

            print(self.check_client(answer[1]))
        if answer[0] == '2':

            print(self.find_client_by_phone(answer[1]))
        if answer[0] == '3':
            print(self.find_client_by_last_name(answer))
        if answer[0] == '4':
            print(self.find_client_by_name(answer))

    def find_client_by_phone(self, phone):
        '''поиск клиента по номеру телефона'''
        with self.conn.cursor() as cur:
            cur.execute('''
                select * from users where id = %s
            ''', (self.check_phone_number(phone)[2],))
            answer = cur.fetchone()
        print(f'клиент с номером телефона {phone} \n{" ".join([str(i) for i in answer])}')


def start():
    '''старт'''
    while True:
        print(f'добавить клиента - 1,\nдобавить номер тедефона - 2\nизменить данные о клиенте - 3\nудалить телефон - 4\nудалить клиента - 5\nнайти клиента по данным - 6\nвыход - 0')

        answer = input('выберите пункт меню ')
        if answer == '1':
            user_input = input('введите фамилию, имя, email - через пробел ').split(' ')
            a.add_client(user_input[0], user_input[1], user_input[2])
        if answer == '2':
            user_input = input('введите  email клиента,которому добавляем номер, и номер телефона - через пробел ').split(' ')
            a.adding_a_phone_number(user_input[0], user_input[1])
        if answer == '3':
            a.change_info()
        if answer == '4':
            user_input = input('введите  email клиента,которому удаляем номер, и номер телефона - через пробел ').split(' ')
            a.del_phone(user_input[0], user_input[1])
        if answer == '5':
            a.del_client()
        if answer == '6':
            a.find_client()
        if answer == '0':
            print('Досвидание')
            break


if __name__ == '__main__':
    a = DB('db1', 'postgres', 'qwr1d', 'localhost', '5432')
    a.drop_table()
    a.create_table()
    a.add_client('andrey','andreev','email1')
    a.add_client('borisov', 'boris', 'email2')
    a.add_client('sergey', 'sergeev', 'email3')
    a.add_client('dmitriy', 'dmitryev', 'email4')
    a.adding_a_phone_number('email4','444')
    a.adding_a_phone_number('email4', '555')
    a.adding_a_phone_number('email3', '562')
    start()