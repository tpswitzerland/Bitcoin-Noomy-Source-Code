// Copyright (c) 2011-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCOINNOOMY_QT_BITCOINNOOMYADDRESSVALIDATOR_H
#define BITCOINNOOMY_QT_BITCOINNOOMYADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class BitcoinNoomyAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit BitcoinNoomyAddressEntryValidator(QObject* parent);

    State validate(QString& input, int& pos) const;
};

/** BitcoinNoomy address widget validator, checks for a valid bitcoinnoomy address.
 */
class BitcoinNoomyAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit BitcoinNoomyAddressCheckValidator(QObject* parent);

    State validate(QString& input, int& pos) const;
};

#endif // BITCOINNOOMY_QT_BITCOINNOOMYADDRESSVALIDATOR_H
