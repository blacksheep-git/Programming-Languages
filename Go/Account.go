package main

import "fmt"

type IAccount interface {
	Accrue(rate float64)
	Balance() float64
	Deposit(amount float64)
	Withdraw(amount float64)
	String() string
}

type Account struct {
	number   string
	customer *Customer
	balance  float64
}

func (account *Account) NewAccount(accountNumber string, customer *Customer, balance float64) (a *Account) {
	a = new(Account)
	a.Init(accountNumber, customer, balance)
	return a
}
func (account *Account) Init(accountNumber string, customer *Customer, balance float64) {
	account.number = accountNumber
	account.customer = customer
	account.balance = balance
}

func (account *Account) Accrue(rate float64) {}

func (account *Account) Balance() float64 {
	return account.balance
}

func (account *Account) Deposit(amount float64) {
	account.balance = account.balance + amount
}

func (account *Account) Withdraw(amount float64) {
	account.balance = account.balance - amount
}

func (account *Account) String() string {
	return fmt.Sprintf("%s : %s : %.2f \n", account.number, account.customer, account.balance)
}
