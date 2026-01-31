import { useForm, FormProvider } from 'react-hook-form';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { UIButton, UICard, UIInput, UITextarea } from '../../../components/common/ui';
import { jobRules } from "../validations/jobRules.js";
import { useEffect } from "react";

const AddNewJob = ({
	isEditing,
	job,
	onSubmit,
	onCancel
}) => {
	const methods = useForm({
		defaultValues: job
	});

	const {
		handleSubmit,
		reset
	} = methods;

	useEffect(() => {
		reset(job);
	}, [job, reset]);

	const rules  = jobRules();

	return (
		<FormProvider {...methods}>
			<UICard
				variant="primary"
				title={isEditing ? 'Edit Job Position' : 'Add New Job Position'}
				headerIcon={
					<FontAwesomeIcon icon={isEditing ? 'edit' : 'plus-circle'} />
				}
			>
				<form onSubmit={handleSubmit(onSubmit)}>
					<UIInput
						name="name"
						label="Name"
						placeholder="e.g. Job position"
						rules={rules.name}
					/>

					<UITextarea
						name="description"
						label="Description"
						placeholder="Brief description of the role..."
						rows={3}
						rules={rules.description}
					/>

					<div className="d-grid gap-2">
						<UIButton type="submit">
							{isEditing ? 'Update Job Position' : 'Save Job Position'}
						</UIButton>

						{isEditing && (
							<UIButton
								variant="outline-secondary"
								type="button"
								onClick={onCancel}
							>
								Cancel
							</UIButton>
						)}
					</div>
				</form>
			</UICard>
		</FormProvider>
	);
};

export default AddNewJob;
