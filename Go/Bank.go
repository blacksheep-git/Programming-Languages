package main

import "fmt"

type Bank struct {
	accounts []interface{ IAccount }
}

func (bank *Bank) Add(account interface{ IAccount }) {
	bank.accounts = append(bank.accounts, account)
}

func (bank *Bank) Accrue(rate float64) {
	for i := 0; i < len(bank.accounts); i++ {
		account := bank.accounts[i]
		account.Accrue(rate)
	}
}

func (bank *Bank) String() string {
	var retVal string
	for _, account := range bank.accounts {
		retVal += fmt.Sprintf("%s", account)
	}
	return retVal
}

func main() {
	bank := &Bank{}
	c := &Customer{name: "Ann"}
	bank.Add(NewCheckingAccount("01001", c, 100.00))
	bank.Add(NewSavingAccount("01002", c, 200.00))
	fmt.Println("Staring balance:")
	fmt.Printf("%s\n", bank)

	fmt.Println("After Accrue(0.02):")
	bank.Accrue(0.02)
	fmt.Printf("%s\n", bank)

	fmt.Println("After Withraw(55.01):")
	bank.accounts[0].Withdraw(55.01)
	bank.accounts[1].Withdraw(55.01)
	fmt.Printf("%s\n", bank)

	fmt.Println("After Deposit(59):")
	bank.accounts[0].Deposit(59)
	bank.accounts[1].Deposit(59)
	fmt.Printf("%s\n", bank)
}
