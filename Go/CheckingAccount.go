package main

type ICheckingAccount interface {
	IAccount
}

type CheckingAccount struct {
	Account
}

func NewCheckingAccount(accountNumber string, customer *Customer, balance float64) (a *CheckingAccount) {
	a = new(CheckingAccount)
	a.Init(accountNumber, customer, balance)
	return a
}

func (checkingAccount *CheckingAccount) Init(accountNumber string, customer *Customer, balance float64) {
	checkingAccount.Account.Init(accountNumber, customer, balance)
}

func (checkingAccount *CheckingAccount) Accrue(rate float64) {}
