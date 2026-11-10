//
// Copyright (C) 2013-2018 University of Amsterdam
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public
// License along with this program.  If not, see
// <http://www.gnu.org/licenses/>.
//

import QtQuick
import QtQuick.Layouts
import JASP
import JASP.Controls

import "./common" as BAIN

Form
{
	columns: 							2

	TextArea
	{
		name: 							"syntax"
		textType: 						JASP.TextTypeLavaan
		Layout.columnSpan: 				2
	}

	Group
	{
		title:							qsTr("Model Options")
		
		DropDown
		{
			name: 						"factorStandardisation"
			label: 						qsTr("Factor scaling")
			indexDefaultValue: 			0
			values:
				[
				{ label: qsTr("Factor variance"), value: "std.lv"			},
				{ label: qsTr("Factor loading"),  value: "auto.fix.first"	}
			]
		}

		DropDown
		{
			name: 						"fixedFactors"
			label: 						qsTr("Grouping variable")
			showVariableTypeIcon: 		true
			addEmptyValue: 				true
			source: 					[ { isDataSetVariables: true, use: "type=ordinal|nominal" } ]
		}
	}

	ColumnLayout
	{
		spacing: 						1 * preferencesModel.uiScale
		
		Group
		{
			title: 						qsTr("Tables")

			CheckBox
			{
				name: 					"descriptives"
				text: 					qsTr("Coefficients")
				
				CIField
				{
					name: 				"credibleInterval"
					text: 				qsTr("Credible interval")
				}
			}
		}

		Group
		{
			title: 						qsTr("Plots")

			CheckBox
			{
				name: 					"pathDiagram"
				text: 					qsTr("Path diagram")

				CheckBox
				{
					name:				"pathDiagramEstimates"
					text:				qsTr("Show parameter estimates")
				}

				CheckBox
				{
					name:				"pathDiagramLegend"
					text:				qsTr("Show legend")
				}
			}
		}
	}

	Divider
	{
		width: 							parent.width
	}

	Group
	{
		title: 							qsTr("Additional Options")
		
		BAIN.Seed { }

		BAIN.Fraction { }

		CheckBox
		{
			name: 						"standardized"
			text: 						qsTr("Standardize coefficients")
		}
	}

	ColumnLayout
	{
		Group
		{
			title: 						qsTr("Tables")

			CheckBox
			{
				name: 					"bayesFactorMatrix"
				text: 					qsTr("Bayes factor matrix")
			}
		}

		Group
		{
			title: 						qsTr("Plots")

			CheckBox
			{
				name: 					"bayesFactorPlot"
				text: 					qsTr("Posterior probabilities")
			}
		}
	}

	Section
	{
		text: 							qsTr("Model Constraints")
		columns:						1

		Text
		{
			text: 						qsTr("Hypotheses can be formulated using the parameter names that appear if the 'Coefficients' box is ticked.\nDo NOT use spaces in the parameter names. Place each hypothesis on a new line. For example:\n\nA=~x1 = A=~x2 = A=~x3 = A=~x4\nA=~x1 > A=~x2 > A=~x3 = A=~x4\nA=~x1 > 0 & A=~x2 > 0 & A=~x3 > 0 & A=~x4 > 0\n\nRead the help file for further instructions about formulating hypotheses and what can and cannot be done\nwith Bain Structural Equation Modeling.")
		}

		TextArea
		{
			name: 					"model"
			text: 					""
			textType: 				JASP.TextTypeModel
			trim: 					true
		}
	}
}
