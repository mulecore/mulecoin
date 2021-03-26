// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) 2017-2019 The Raven Core developers
// Copyright (c) 2020-2021 The Mulecoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef MULECOIN_QT_MULECOINADDRESSVALIDATOR_H
#define MULECOIN_QT_MULECOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class MulecoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit MulecoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Mulecoin address widget validator, checks for a valid mulecoin address.
 */
class MulecoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit MulecoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // MULECOIN_QT_MULECOINADDRESSVALIDATOR_H
