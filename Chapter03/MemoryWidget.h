#ifndef MEMORYWIDGET_H
#define MEMORYWIDGET_H

#include <QLineSeries>

#include "SysInfoWidget.h"

class MemoryWidget : public SysInfoWidget
{
    Q_OBJECT
public:
    explicit MemoryWidget(QWidget *parent = 0);

protected slots:
    void updateSeries() override;

private:
    QLineSeries* mSeries;
    qint64 mPointPositionX;
};

#endif // MEMORYWIDGET_H
